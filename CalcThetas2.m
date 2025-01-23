classdef CalcThetas2
    properties
        Pcirc
        thetas
        Plosscirc
        DBAR
    end
    methods
        function obj = CalcThetas2(LinData,DBAR,BBus,Bbus,Bbusl,Pespl,sw,tol)
            %Inicializating
            [NBus, ~] = size(DBAR);
            [NLin, ~] = size(LinData);
            obj.Pcirc = zeros(NLin,1);
            obj.Plosscirc = zeros(NLin,1);
            Gbus = real(BBus);
            thetasl = -inv(Bbusl) * Pespl;
            obj.thetas = [thetasl(1:sw-1); 0; thetasl(sw:end)]; %adding 0 in theta vector for swing bar
            count=0;
            delta=1;

            while delta > tol && count ~= 20
                Plbar = zeros(NBus,1);
                for il = 1:NLin
                    k = LinData(il, 1);
                    m = LinData(il, 2);
                    obj.Plosscirc(il,1) = Gbus(k,m) * (obj.thetas(k)-obj.thetas(m))^2;
                    Plbar(k,1) = Plbar(k,1) - obj.Plosscirc(il,1)/2;
                    Plbar(m,1) = Plbar(m,1) - obj.Plosscirc(il,1)/2;
                end

                DBAR(sw,8) = DBAR(sw,8) + Plbar(sw,1);
                Plbar(sw, :) = [];
                thetaold = obj.thetas;
                Plnew = (Pespl+Plbar);
                thetasl = -inv(Bbusl) * Plnew;
                obj.thetas = [thetasl(1:sw-1); 0; thetasl(sw:end)];

                delta = max(abs(thetaold - obj.thetas));
                count = count+1;
            end
            kold = 0;
            mold = 0;
            for il = 1:NLin
                k = LinData(il, 1);
                m = LinData(il, 2);
                if kold == k && mold == m
                    obj.Pcirc(il-1,1) = (Bbus(k,m)*(obj.thetas(k,1) - obj.thetas(m,1)) + obj.Plosscirc(il-1,1)/2)/2;
                    obj.Pcirc(il,1) = (Bbus(k,m)*(obj.thetas(k,1) - obj.thetas(m,1)) + obj.Plosscirc(il,1)/2)/2;
                else
                    obj.Pcirc(il,1) = Bbus(k,m)*(obj.thetas(k,1) - obj.thetas(m,1)) + obj.Plosscirc(il,1)/2;
                end
                kold = k;
                mold = m;
            end
        end
        function [Pcirc,thetas,Plosscirc,DBAR] = getThetas2(obj)
            Pcirc = obj.Pcirc;
            thetas = obj.thetas;
            Plosscirc = obj.Plosscirc;
            DBAR = obj.DBAR;
        end
    end
end