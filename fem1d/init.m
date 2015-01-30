function [FctBases] = init(N)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Evaluation des polynomes de Lagrange aux points de Gauss
% Sorie: FctBases
%                .Gauss_points = points de Gauss
%                .nblignes, .nbcolonnes = dimension de la base
%                .evaluer = base aux points de gauss
%                .evaluerd = derivé de la base aux points de Gauss
% Entrée:
%       N = degré maximum des polynomes de la base de Lagrange
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


[x,w] = gauss(4);
FctBases.Gauss_points = x'; 
FctBases.Gauss_poids =  w;  


% N+1 = nbre de fonctions de base de Lagrange
FctBases.nblignes   = N + 1;
FctBases.nbcolonnes = N + 1;

% Evaluation des fonctions de bases et leurs derivés aux points de Gauss
for i=1:N+1
    [Nref,NrefP] = Lagrange(N,i,FctBases.Gauss_points);
    FctBases.evaluer(i,:)  = Nref;
    FctBases.evaluerd(i,:) = NrefP;
end

end
 