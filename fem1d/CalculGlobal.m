function [A,B] = CalculGlobal(fonctq,foncth,fonctp,fonctf,x,adress,FctBases)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calcul de la matrice globale et du vecteur global
% Sortie :
%        A = matrice globale du syst�me 
%        B = second membre du sys�me 
% Entr�e:
%       fonctq, foncth, fonctp et fonctf sont telles que
%                    -(q(x)u(x))' + h(x)u'(x) + p(x)u(x) = f(x)
%       x = coordon�es de discr�tisation du domaine (y compris les noeuds
%       internes des �l�ments
%       adress = degre de libert� des noeuds � chaque �l�ment
%       FctBases = structures d'�l�ments finis (fonctions de bases et leurs
%       deriv�s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


dim = length(x);      % nbre de noeuds du maillage
ne = size(adress,2);  % nbre d'�l�ments du maillage

A = zeros(dim,dim);
B = zeros(dim,1);


% boucles sur les elements
for k=1:ne

% transfert sur l'element courant
xe = [x(adress(1,k)),x(adress(2,k))];

[mat,sm] = CalculElem(fonctq,foncth,fonctp,fonctf,xe,FctBases);
    
% assemblage
    for i = 1:FctBases.nblignes       
        I = adress(i,k);
        B(I) = B(I) + sm(i);
        
        for j = 1:FctBases.nbcolonnes       
            J = adress(j,k);
            A(I,J)= A(I,J) + mat(i,j);
        end
        
     end
end

end
