classdef DispResults
    %DISPRESULTS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties

    end
    
    methods
        function obj = DispResults(Pcirc, Pcirc2, thetas, thetas2, Plosskm, DBAR, DCIR, Sbase);
            [NBus, ~] = size(DBAR);
            [NLin, ~] = size(DCIR);
            count = 0;
            tipo = strings(NBus, 1);

            disp(sprintf('Resultados das Barras'));
            disp(sprintf('====================='));
            disp(sprintf(' '));
            %Table 1, Bar datas Flow DC without losses
            if ~isempty(thetas)
                count = count + 1;
                disp(sprintf('Tabela %1d: Fluxo Dc sem perdas', count));
                disp(sprintf('Barra Tipo  Tensão(pu)  Ângulo(°)  PG(MW)  PL(MW)'));
                disp(sprintf('+---+ +--+ +---------+ +--------+ +-----+ +-----+'));
                for ib = 1:NBus
                    ang = thetas(ib)*180/pi;
                    if DBAR(ib,5) == 0
                        tipo(ib,1) = 'SW';
                    elseif DBAR(ib,5) == 1
                        tipo(ib,1) = 'PV';
                    elseif DBAR(ib,5) == 2
                        tipo(ib,1) = 'PQ';
                    end
                    Pg = DBAR(ib,8) * Sbase;
                    Pl = DBAR(ib,2) * Sbase;
                    disp(sprintf('%5d %4s %11.4f %10.4f %7.2f %7.2f',ib,tipo(ib,1),DBAR(ib,6),ang,Pg,Pl));  
                end
                disp(sprintf('+---+ +--+ +---------+ +--------+ +-----+ +-----+'));
                disp(sprintf(' '));
            end

            if ~isempty(thetas2)
                %Table 2, Bar datas Flow DC with losses
                count = count + 1;
                disp(sprintf('Tabela %1d: Fluxo Dc com perdas', count));
                disp(sprintf('Barra Tipo  Tensão(pu)  Ângulo(°)  PG(MW)  PL(MW)'));
                disp(sprintf('+---+ +--+ +---------+ +--------+ +-----+ +-----+'));
                for ib = 1:NBus
                    ang = thetas2(ib)*180/pi;
                    if DBAR(ib,5) == 0
                        tipo(ib,1) = 'SW';
                    elseif DBAR(ib,5) == 1
                        tipo(ib,1) = 'PV';
                    elseif DBAR(ib,5) == 2
                        tipo(ib,1) = 'PQ';
                    end
                    Pg = DBAR(ib,8) * Sbase;
                    Pl = DBAR(ib,2) * Sbase;
                    disp(sprintf('%5d %4s %11.4f %10.4f %7.2f %7.2f',ib,tipo(ib,1),DBAR(ib,6),ang,Pg,Pl));  
                end
                disp(sprintf('+---+ +--+ +---------+ +--------+ +-----+ +-----+'));
                disp(sprintf(' '));
            end

                disp(sprintf('Resultados das Linhas'));
                disp(sprintf('====================='));
                disp(sprintf(' '));
            if ~isempty(thetas)
                %Table 3, Lin datas Flow DC without losses
                count = count + 1;
                disp(sprintf('Tabela %1d: Fluxo Dc sem perdas', count));
                disp(sprintf(' De  Para  Pkm(MW)  Perda (MW)   CapMax (MW)  Lim(%%)'));
                disp(sprintf('+--+ +--+ +------+ +----------+ +----------+ +------+'));
                for il = 1:NLin
                    Pkm = Pcirc(il,1)*Sbase;
                    Perda = 0;
                    Capmax = DCIR(il,10)*Sbase;
                    lim = (abs(Pkm)*100)/Capmax;
                    disp(sprintf('%4d %4d %8.2f %12.2f %12.4f %8.2f', DCIR(il,1), DCIR(il,2), Pkm, Perda, Capmax, lim));
                end
                disp(sprintf('+--+ +--+ +------+ +----------+ +----------+ +------+'));
                disp(sprintf(' '));
            end

            if ~isempty(thetas2)
                %Table 4, Lin datas low DC without losses
                count = count + 1;
                disp(sprintf('Tabela %1d: Fluxo Dc com perdas', count));
                disp(sprintf(' De  Para  Pkm(MW)  Perda (MW)   CapMax (MW)  Lim(%%)'));
                disp(sprintf('+--+ +--+ +------+ +----------+ +----------+ +------+'));
                for il = 1:NLin
                    Pkm = Pcirc2(il,1)*Sbase;
                    Perda = Plosskm(il,1)*Sbase;
                    Capmax = DCIR(il,10)*Sbase;
                    lim = (abs(Pkm)*100)/Capmax;
                    disp(sprintf('%4d %4d %8.2f %12.2f %12.4f %8.2f', DCIR(il,1), DCIR(il,2), Pkm, Perda, Capmax, lim));
                end
                disp(sprintf('+--+ +--+ +------+ +----------+ +----------+ +------+'));
                disp(sprintf('\n'));
            end
        end
    end
end

