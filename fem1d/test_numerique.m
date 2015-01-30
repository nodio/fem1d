% Thierno DIOP (MAT-7430 H14) 
% Script permettant de faire les tests pour fem1d
% La fonction fem1d est appellé à la derniere ligne de code
% Differents cas tests sont mis en evidence dans ce script
% A ameliorer

clear all;
close all;
disp('------------------- DEBUT  ----------------------' )
%% Exercice 1
%(a)Conditions de Dirichlet
fonctq = @(x) 1+0*x;
foncth = @(x) 0+0*x;
fonctp = @(x) 0+0*x;
fonctf = @(x) (1+16*pi^2)*cos(4*pi*x)-4*pi*sin(4*pi*x);
uexact = @(x) cos(4*pi*x);
duexact= @(x) -4*pi*sin(4*pi*x);
d=0; debut=1;
f=0; fin=1;
N=2;

%(b) Conditions de Dirichlet en a et Neumann en b
%fonctq = @(x) 1+0*x;
%foncth = @(x) 1+0*x;
%fonctp = @(x) 1+0*x;
%fonctf = @(x) x.*x + x -2 ;
%uexact = @(x) x.*x-x+1;
%duexact = @(x) 2*x-1;
%d=0; debut=1;  % Dirichlet
%f=1; fin=1;    % Neumann
%N=1;

%(c) Conditions de  Neumann en a et Dirichlet en b
%fonctq = @(x) 1+0*x;
%foncth = @(x) -1+0*x;
%fonctp = @(x) 1+0*x;
%fonctf = @(x) (1+16*pi^2)*sin(4*pi*x)-4*pi*cos(4*pi*x);
%uexact = @(x) sin(4*pi*x);
%duexact= @(x) 4*pi*cos(4*pi*x);
%d=1; debut=4*pi;
%f=0; fin=0;
%N=1;

%(d) Conditions de Neumann
%fonctq = @(x) 1+0*x;
%foncth = @(x) 0+0*x;
%fonctp = @(x) 1+0*x;
%fonctf = @(x) (1+16*pi^2)*sin(4*pi*x);
%uexact = @(x) sin(4*pi*x);
%duexact= @(x) 4*pi*cos(4*pi*x);
%d=1; debut=4*pi;
%f=1; fin=4*pi;
%N=1;


%%

%% Exercice 3
%eps = 0.001; %0.01; 0.001;
%fonctq = @(x) eps +0*x;
%foncth = @(x) 1+0*x;
%fonctp = @(x) 0+0*x;
%fonctf = @(x) 1+0*x;
%uexact = @(x) (exp(x/eps)-1) / (1-exp(1/eps)) + x;
%duexact =@(x) (exp(x/eps)-1) / eps*(1-exp(1/eps)) + 1;
%d=0; debut=-1/(1-exp(1/eps));
%f=0; fin=0;
%N=1;
%%

%% Exercie 4
%alp = 3/4; %7/4;
%fonctq = @(x) 1 +0*x;
%foncth = @(x) 0+0*x;
%fonctp = @(x) 1+0*x;
%fonctf = @(x) alp*(1-alp)*x.^(alp-2)+x.^alp;
%uexact = @(x) x.^alp;
%duexact =@(x) alp*x.^(alp-1);
%d=0; debut=0;
%f=0; fin=1;
%N=1;
%%


% Appel à la fonction fem1d pour les variables définies ci-dessus
fem1d(fonctq,foncth,fonctp,fonctf,uexact,duexact,d,debut,f,fin,N);
disp('-------------------- FIN ------------------------' )
