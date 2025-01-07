classdef CalcThetas
    properties
        Pcirc
        thetas
    end
    methods
        function obj = CalcThetas(LinData,Bbus,Bbusl,Pespl,sw)
            [NLin, ~] = size(LinData);
            obj.Pcirc = zeros(NLin,1);
            thetasl = -inv(Bbusl) * Pespl;
            obj.thetas = [thetasl(1:sw-1); 0; thetasl(sw:end)]; %adding 0 in theta vector to swing bar

            for il = 1:NLin
                k = LinData(il, 1);
                m = LinData(il, 2);
                obj.Pcirc(il) = Bbus(k,m)*(obj.thetas(k,1) - obj.thetas(m,1));
            end
        end

        function [Pcirc,thetas] = getThetas(obj)
            Pcirc = obj.Pcirc;
            thetas = obj.thetas;
        end
    end
end
