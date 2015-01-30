function [Nref,NrefP] = Lagrange(N,i,x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définition des polynomes de Lagrange P_N sur l'intervalle de référence
% Sortie:
%        Nref  = base de Lagrange
%        NrefP = derivé de la base de Lagrange
% Entrée:
%        N = degre du polynome (pour P_1, N=1; pour P_2, N=2
%        i = l'indice du polynome Nref de P_N
%        x = variable des polynomes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 if ( N==1 )
    Nref = ( (1-x)/2 )*(i==1)  + ( (1+x)/2 )*(i==2);
    NrefP =( -1/2 + 0*x )*(i==1) + ( 1/2 + 0*x )*(i==2);
 elseif ( N==2 )
    Nref =( x.*(x-1)/2 )*(i==1) +( x.*(1+x)/2 )*(i==2) +( 1-x.*x )*(i==3);
    NrefP =( x-1/2 )*(i==1) + ( x+1/2 )*(i==2) + ( -2*x )*(i==3);
 else
    Nref =((1-x).*(9*x.*x-1)/16 )*(i==1)+((1+x).*(9*x.*x-1)/16)*(i==2)...
        + ((9/16)*(1-x.*x).*(1-3*x))*(i==3)+((9/16)*(1-x.*x).*(1+3*x))*(i==4);
    
    NrefP =( (-27*x.*x+18*x+1)/16 )*(i==1) + ( (27*x.*x+18*x-1)/16 )*(i==2) ...
        + ( (9/16)*(9*x.*x -2*x-3))*(i==3)+((9/16)*(-9*x.*x-2*x+3))*(i==4);      
 end
 
end
    