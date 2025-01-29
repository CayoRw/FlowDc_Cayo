clc
clear all

% File name
filename = 'dados_sistema13B_EC3_Teste1.txt';
%filename = 'Data_Example.txt';

% Inicializating
Sbase = 100;  % MVA
tol = 0.00001;
%Please dont delete these 5 arrays. If you do, DispResults function might not work
thetas = []; 
thetas2 = [];
Pcirc = [];
Pcirc2 = [];
Plosskm = [];

% Getting the datas 
a = ReadData(filename);
[DBAR, DCIR] = a.getmatriz();       

DCIR(10, :) = [];

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
[Pcirc2,thetas2,Plosskm,DBAR] = e.getThetas2();
%DispSeverity();

%Print the results
DispResults(Pcirc, Pcirc2, thetas, thetas2, Plosskm, DBAR2, DCIR, Sbase);    