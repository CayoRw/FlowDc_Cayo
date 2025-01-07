clc
clear all

% Inicializating
Sbase = 100;  % MVA
tol = 0.0001;
Pcirc = [];
thetas = [];

% File name
filename = 'Data_Example.txt';

% Getting the datas 
a = ReadData(filename);
[DBAR, DCIR] = a.getmatriz();       

% Getting the YBus
b = MakeYBus(DBAR,DCIR);
[BBus, Bbus, Bbusl, sw] = b.getBBus();              

% Getting the Pesp and Qesp
c = GetPesp(DBAR);
[Pesp, Pespl] = c.getPesp();           

%Getting the thetas by flow DC without losses
d = CalcThetas(DCIR,Bbus,Bbusl,Pespl,sw);
[Pcirc,thetas] = d.getThetas();

%Getting the thetas by flow DC with losses by interaction
e = CalcThetas2(DCIR,DBAR,BBus,Bbus,Bbusl,Pespl,sw,tol);
[Pcirc2,thetas2,Plosskm] = e.getThetas2();

% Print the results
%DispResults(FlowP, FlowQ, FlowS, ThetasV, Pgd, Qgd, DBAR, DCIR, Sbase);