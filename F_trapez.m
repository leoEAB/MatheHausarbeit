% Eingabe
% z  : Vector z der Größe k x 1
% ti : Zeitpinkt ti
% h  : Schrittweite h
% yi : Vektor y^(i) der Größe k x 1
% f  : Funktionshandle für f(t,y)
% df : Funktionshanfle für D(y)f(t,y)
% Ausgabe
% F  : Vektor F(trapez)(z) der Größe k x 1
% J  : Jacobi-Matrix DF(trapez) der Größe k x k als sparse matric


function [F,J] =  F_trapez(z, ti, h, yi, f, df)
    % Initialiaze Outputs
    k = length(z);  
    F = zeros(k,1);
    J = sparse(k,k);
    dz = sparse(k,k);
    ones_vector = ones(k,1);
    % compute dz
    dz = diag(ones_vector);
    
    % compute F
    F = (h/2).*(f(ti, yi)+f((ti+h),(yi+z)))-z;
    
    % compute J
    J = (h/2).*(df(ti, yi)+df((ti+h),(yi+z)))-dz;
    
end
