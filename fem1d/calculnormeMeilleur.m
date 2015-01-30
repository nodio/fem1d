function [normeL2,seminormeH1]=calculnormeMeilleur(adress,uexact,duexact,xn,u,FctBases)


ne = size(adress,2);  % nbre d'éléments du maillage

normeL2 = 0;
seminormeH1 = 0;

% boucles sur les elements
for k=1:ne
    
    % transfert sur l'element courant
    xe = [xn(adress(1,k)),xn(adress(2,k))];

    % Longueur du segment
    h = xe(2)-xe(1);

    % Transformation de la reference à la vraie valeur
    x = (h/2) * (FctBases.Gauss_points + 1) + xe(1);   % Kref = [-1,1]
    w = FctBases.Gauss_poids;


    % Calcul de u aux points de Gauss
    u_x  = 0; 
    du_x = 0;
    for i=1:FctBases.nblignes
        u_x = u_x + u(adress(i,k))*FctBases.evaluer(i,:);
        du_x = du_x + u(adress(i,k))*FctBases.evaluerd(i,:);
    end
    du_x = 2/h*du_x;
    
    normeL2 = normeL2 + h/2*dot((u_x-uexact(x)),(u_x-uexact(x)).*w);      
    seminormeH1 = seminormeH1 + h/2*dot((du_x-duexact(x)),(du_x-duexact(x)).*w); 
    
end 
normeL2 = sqrt(normeL2);
seminormeH1 = sqrt(seminormeH1);




