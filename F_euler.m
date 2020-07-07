% Eingabe
% z  : Vector z der Größe k x 1
% ti : Zeitpunkt ti
% h  : Schrittweite h
% yi : Vektor y^(i) der Größe k x 1
% f  : Funktionshandle für f(t,y)
% df : Funktionshandle für D(y)f(t,y)
% Ausgabe
% F  : Vektor F(euler)(z) der Größe k x 1
% J  : Jacobi-Matrix DF(euler) der Größe k x k als sparse matrix


function [F,J] =  F_euler(z, ti, h, yi, f, df)
    % Initialiaze Outpurs
    k = length(z);  
    F = zeros(k,1);
    J = sparse(k,k);
    
    % compute F
    F = h.*f((ti+h), yi) - z;
    
    % compute J
    J = h.*df((ti+h),(yi+z)) - 1;
    
end