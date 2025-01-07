classdef CalcThetas2
    properties
        Pcirc
        thetas
        Plcirc
    end
    methods
        function obj = CalcThetas2(LinData,BusData,BBus,Bbus,Bbusl,Pespl,sw,tol)
            %Inicializating
            [NBus, ~] = size(BusData);
            [NLin, ~] = size(LinData);
            obj.Pcirc = zeros(NLin,1);
            obj.Plcirc = zeros(NLin,1);
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
                    obj.Plcirc(il,1) = Gbus(k,m) * (obj.thetas(k)-obj.thetas(m))^2;
                    Plbar(k,1) = Plbar(k,1) - obj.Plcirc(il,1)/2;
                    Plbar(m,1) = Plbar(m,1) - obj.Plcirc(il,1)/2;
                end

                Plbar(sw, :) = [];
                thetaold = obj.thetas;
                thetasl = -inv(Bbusl) * (Pespl+Plbar);
                obj.thetas = [thetasl(1:sw-1); 0; thetasl(sw:end)];
                
                delta = max(abs(thetaold - obj.thetas));
                count = count+1;
            end
            for il = 1:NLin
                k = LinData(il, 1);
                m = LinData(il, 2);
                obj.Pcirc(il) = Bbus(k,m)*(obj.thetas(k,1) - obj.thetas(m,1));
            end
        end
        function [Pcirc,thetas,Plcirc] = getThetas2(obj)
            Pcirc = obj.Pcirc;
            thetas = obj.thetas;
            Plcirc = obj.Plcirc;
        end
    end
end