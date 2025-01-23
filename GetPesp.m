classdef GetPesp
    properties
        Pesp
        Pespl
        DBAR2
    end
    methods
        function obj = GetPesp(DBAR)
            %Inicializating
            [NBus, ~] = size(DBAR);
            obj.Pesp = zeros(NBus,1);
            sum=0;
            for il = 1:NBus
                obj.Pesp(il,1) = DBAR(il,8) - DBAR(il,2);
                sum = sum + DBAR(il,8) - DBAR(il,2);
            end
            obj.Pespl = obj.Pesp;
            for i = 1:NBus
                if DBAR(i, 5) == 0
                    obj.Pespl(i, :) = [];
                    DBAR(i,8) = DBAR(i,8) -sum;
                end
            end
            obj.DBAR2 = DBAR;
        end
        function [Pesp, Pespl,DBAR2] = getPesp(obj)
            Pesp = obj.Pesp;
            Pespl = obj.Pespl;
            DBAR2 = obj.DBAR2;
        end
    end
end
