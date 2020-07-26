function J=fd_nonlin_jac(u,N)
%{
Eingabe:
u Vektor u der Große ¨ (N + 1) × 1
N Anzahl von Teilintervallen N.
Ausgabe:
J Jacobi-Matrix DF(u) der Große ¨ (N + 1) × (N + 1) als sparse matrix
%}



    d = 0.3;    % um
    D = 0.3;    % um^2/us
    k1 = 1.0;  % 1/us
    k2 = 0.01;   % um/us 
    ND = 1000; % 1/um^3
    SL = 0.1;  % um/us
    SR = 1000; % um/us
    
  
%    u = zeros(N+1,1);
    J = zeros(N+1,N+1);
    
    h = d / N; 
    a = D/h.^2;
    e = ( (2*D/(h * h)) + (k1 + k2 * ND) );
    c = D/h.^2;
    g= k2;
    
    
  J(1, 1) = ((-2 * a * h * SL )/ D ) - e - 2 * g * u(1,1)  ; 
  J(1, 2) = a + c;
  
    
    
    J(N + 1 , N) = a + c ;
   J(N + 1, N + 1) = -(e + ((2 * c * h * SR) / D )) - 2 * g * u( N+1, 1) ; 
        
    for i = 2 : N 
        
        
       J(i, i - 1) = a ;
        
       J(i, i ) =  - e - 2 * g * u(i , 1) ;
        
       J(i, i+1 ) = c ;
       
    
        
    end
    bin = spdiags(J);
    c = [-1,0,1];
    J = spdiags(bin,c,J);
    
    
    %J=fd_nonlin_jac([1,2,3,4,5]',4)
    