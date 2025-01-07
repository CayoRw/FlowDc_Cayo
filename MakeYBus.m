classdef MakeYBus
    properties
        BBus
        Bbus 
        Bbusl
        sw
    end

    methods
        function obj = MakeYBus(BusData, LinData)
            [NBus, ~] = size(BusData);
            [NLin, ~] = size(LinData);
            obj.BBus = zeros(NBus, NBus);
            obj.Bbus = zeros(NBus, NBus);

            for il = 1:NLin
                k = LinData(il, 1);
                m = LinData(il, 2);
                ykm = - 1 / (LinData(il, 4) + LinData(il, 5) * 1i);
                bkm = - 1 / LinData(il,5);

                obj.BBus(k, k) = obj.BBus(k, k) + ykm;
                obj.BBus(k, m) = obj.BBus(k, m) - ykm;
                obj.BBus(m, k) = obj.BBus(m, k) - ykm;
                obj.BBus(m, m) = obj.BBus(m, m) + ykm;
                
                obj.Bbus(k, k) = obj.Bbus(k, k) + bkm;
                obj.Bbus(k, m) = obj.Bbus(k, m) - bkm;
                obj.Bbus(m, k) = obj.Bbus(m, k) - bkm;
                obj.Bbus(m, m) = obj.Bbus(m, m) + bkm;
            end
            obj.Bbusl = obj.Bbus;
            for i = 1:NBus
                if BusData(i, 5) == 0
                    obj.sw = i;
                    obj.Bbusl(i, :) = [];
                    obj.Bbusl(:, i) = [];  
                end
            end
        end

        function [BBus, Bbus, Bbusl, sw] = getBBus(obj)
            % Método para retornar a matriz BBus
            BBus = obj.BBus;
            Bbus = obj.Bbus;
            Bbusl = obj.Bbusl;
            sw = obj.sw;
        end
    end
end