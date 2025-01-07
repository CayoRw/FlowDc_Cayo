classdef GetPesp
    properties
        Pesp
        Pespl
    end
    methods
        function obj = GetPesp(BusData)
            %Inicializating
            [NBus, ~] = size(BusData);
            obj.Pesp = zeros(NBus,1);
            for il = 1:NBus
                obj.Pesp(il,1) = BusData(il,8) - BusData(il,2);
            end
            obj.Pespl = obj.Pesp;
            for i = 1:NBus
                if BusData(i, 5) == 0
                    obj.Pespl(i, :) = [];
                end
            end
        end
        function [Pesp, Pespl] = getPesp(obj)
            Pesp = obj.Pesp;
            Pespl = obj.Pespl;
        end
    end
end
