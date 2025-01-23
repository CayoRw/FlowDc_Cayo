clc
clear all

% File name
filename = 'dados_sistema13B_EC3_Teste1.txt';

% Inicializating
Sbase = 100;  % MVA
tol = 0.001;
%Please dont delete these 5 arrays. If you do, DispResults function might not work
thetas = []; 
thetas2 = [];
Pcirc = [];
Pcirc2 = [];
Plosskm = [];

% Combinações de exclusão:
exclusions = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20};
%size(exclusions)
Ranking = zeros (numel(exclusions), 2); 

% Getting the datas 
a = ReadData(filename);
[DBAR_real, DCIR_real] = a.getmatriz();       
DCIR_real(9, :) = [];

%Adaptando para o estudo de caso de uso 3
for i = 1:numel(exclusions)
    DBAR = DBAR_real;
    DCIR = DCIR_real;

    % Obter as linhas a serem excluídas
    linhas_excluidas = exclusions{i};
    % Remover as linhas especificadas no DCIR
    DCIR(linhas_excluidas, :) = [];

    % Getting the YBus
    b = MakeYBus(DBAR,DCIR);
    [BBus, Bbus, Bbusl, sw] = b.getBBus();              
    
    % Getting the Pesp and Qesp
    c = GetPesp(DBAR);
    [Pesp, Pespl,DBAR2] = c.getPesp();               
    
    %Getting the thetas by flow DC without losses
    %d = CalcThetas(DCIR,Bbus,Bbusl,Pespl,sw);  %If you dont want disp the flow dc results, just % these 2 lines
    %[Pcirc,thetas] = d.getThetas();

    %Getting the thetas by flow DC with losses by interaction
    e = CalcThetas2(DCIR,DBAR,BBus,Bbus,Bbusl,Pespl,sw,tol); %If you dont want disp the flow dc with losses results, just % these 2 lines
    [Pcirc2,thetas2,Plosskm] = e.getThetas2();

    if (i == 12)
        %Print the results
        DispResults(Pcirc, Pcirc2, thetas, thetas2, Plosskm, DBAR2, DCIR, Sbase);
    end

    f = Severity(DBAR, DCIR, Pcirc2, Sbase);
    [SumOverload,count] = f.getSum();
    
    Ranking(i,1) = SumOverload;
    Ranking(i,2) = count;
    lost_circuit = mat2str(exclusions{i});
    
    disp(sprintf('Relatório curto n°:%2d da perda %2d - %2d. Valor da contingencia: %5f. Qtd: %2f',i, DCIR_real(i,1), DCIR_real(i,2), Ranking(i,1), Ranking(i,2)));
    disp(sprintf(' '));
end
g = DispRanking(Ranking,DBAR_real,DCIR_real,exclusions);

%Print the results
%DispResults(Pcirc, Pcirc2, thetas, thetas2, Plosskm, DBAR, DCIR, Sbase);