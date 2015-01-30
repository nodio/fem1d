function [mat,sm] = CalculElem(fonctq,foncth,fonctp,fonctf,xe,FctBases)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calcul du vecteur et matrice elementaires associ�es � un �l�ment de la discretisation
% Sortie :
%        mat = matrice �l�mentaire de d'ordre (dimension de P_N)
%        vecteur elementaire associ�e � l'�l�ment
% Entr�e:
%       fonctq, foncth, fonctp et fonctf sont telles que
%                    -(q(x)u(x))' + h(x)u'(x) + p(x)u(x) = f(x)
%       xe = element courant (segment)
%       FctBases = structures d'�l�ments finis (fonctions de bases et leurs
%       deriv�s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Initialisation du vecteur et matrice �l�mentaires
sm = zeros(FctBases.nblignes,1);
mat = zeros(FctBases.nblignes,FctBases.nbcolonnes);


% Longueur du segment
h = xe(2)-xe(1);

% Transformation de la reference � la vraie valeur
x = (h/2) * (FctBases.Gauss_points + 1) + xe(1);   % Kref = [-1,1]
w = FctBases.Gauss_poids;


% Calcul des �l�ments �l�mentaires
for i=1:FctBases.nblignes
    
    sm(i) = dot(fonctf(x),FctBases.evaluer(i,:).*w);      % fref * Nref_i
    
    for j=1:FctBases.nbcolonnes
        % q * (NrefP_j . NrefP_i)
        mat1 = dot(fonctq(x),FctBases.evaluerd(j,:).*FctBases.evaluerd(i,:).*w); 
        % h * (NrefP_j . Nref_i)
        mat2 = dot(foncth(x),FctBases.evaluerd(j,:).*FctBases.evaluer(i,:).*w); 
        % p * (Nref_j . Nref_i)
        mat3 = dot(fonctp(x),FctBases.evaluer(j,:).*FctBases.evaluer(i,:).*w);  
        
        mat(i,j) = 2*mat1/h + mat2 + h*mat3/2;
    end
    
end

sm = (h/2)* sm;



end 




