% Eingabe
% t     : Zeit t
% y     : Vector y der Größe 3 x 1
% Ausgabe
% J    : Matrix Df_chem der Größe 3 x 3

function J = f_chem_jac(t,y)
    %Alocate memorys-space
    J = zeros(3,3); 
    
    %compute dy
    J = [-0.04, 10^4*y(3), 10^4*y(2);
           0.04, -10^4*y(3)-6*10^7*y(2), -10^4*y(2);
           0, 3*10^7, 0];
           
end