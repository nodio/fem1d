function [x,w] = gauss(n)
%
%   n pts Gauss quadrature on [-1,1]
%   x = les noeuds  vecteur colonne
%   w = les poids  vecteur ligne

beta = .5./sqrt(1-(2*(1:n-1)).^(-2));   % 3-term recurrence coeffs
T = diag(beta,1) + diag(beta,-1);       % Jacobi matrix
[V,D] = eig(T);                         % eigenvalue decomposition
x = diag(D);  [x,i] = sort(x);          % nodes
w = 2*V(1,i).^2;                        % weights
%I = w*f(x);                            % the integral

end

