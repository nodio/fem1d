function fem1d(fonctq,foncth,fonctp,fonctf,uexact,duexact,d,debut,f,fin,N)


%%                     Thierno DIOP   ( MAT-7430 H14 )

% script pour code elements finis 1d du problème
%                       -(q(x)u(x))' + h(x)u'(x) + p(x)u(x) = f(x)
%                        C.L  Dirichlet  et/ou de Neumann
%
% uexact = solution exacte du problème
% d = type de condition limite en a (0 = Dirichlet et 1 = Neumann
% debut = valeur aux limites de Dirichlet ou Neumann selon la valeur de d
% f = type de condition limite en a (0 = Dirichlet et 1 = Neumann
% fin = valeur aux limites de Dirichlet ou Neumann selon la valeur de f
% N = Lagrange de type P_N

%%

%%
% maillage regulier
a=0;
b=1;
ne=10; %80;
ns = ne + 1;

x = linspace(a,b,ns);

%% Définition des degres de liberté et de connection

e   = 1 : N : N*(ne-1)+1;     %
dim = N*ne + 1;               % nbre de noeuds y compris ceux d'interpolation
connect = [e ; N+e];          % connection des elements du maillage 
xn = linspace(a,b,dim);       % sommets de tous les noeuds du maillage
adress = connect;             % 
for i=1:N-1
    adress = [adress ; e+i];  % rajout des degres des noeuds internes
end

%%
%%
% evaluation des fonctions de bases aux pts de Gauss
FctBases = init(N);

% assemblage de la matrice et du vecteur globaux
[A,B] = CalculGlobal(fonctq,foncth,fonctp,fonctf,xn,adress,FctBases);
A

% solution initiale
u = zeros(dim,1);

% définition des noeuds à calculer (noeuds libres)
noeudLibre = 1:dim;
%%

%% imposition des conditionx aux limites

if (d==0)                        % Dirichlet en a
  u(1) = debut;
  noeudLibre(1) = [];
else                             % Neumann en a
    B(1) = B(1) - debut;
end

if (f==0)                        % Dirichlet en b
    u(end) = fin;
    noeudLibre(end) = [];
else                             % Neumann en b
    B(end) = B(end) + fin;
end
%%   

%%
% ajout du relevement dans le second membre
B = B - A*u;    

% resolution sur les noeuds libres
u(noeudLibre) = A(noeudLibre,noeudLibre) \ B(noeudLibre); %A\B;

% calcul de l'erreur
%[normeL2,seminormeH1]=calculnorme(adress,uexact,xn,u,FctBases);

[normeL2,seminormeH1] = calculnormeMeilleur(adress,uexact,duexact,xn,u,FctBases);
 disp('erreur L2 = ' ), normeL2
 disp('erreur seminorme H1 = ' ),  seminormeH1

 
% visualisation
plot(xn,u,'r')
hold on
ezplot(uexact,[a,b])
xlabel('x'); ylabel('u(x)');
legend('uapp','uexact','Location','Best');



