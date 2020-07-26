function F= fd_nonlin(u,N)
%{
Eingabe:
u Vektor u der Große ¨ (N + 1) × 1
N Anzahl von Teilintervallen N.
Ausgabe:
F Vektor F(u) der Große ¨ (N + 1) × 1


%}


    d = 0.3;    % um
    D = 0.3;    % um^2/us
    k1 = 1.0;  % 1/us
    k2 = 0.01;   % um/us 
    ND = 1000; % 1/um^3
    SL = 0.1;  % um/us
    SR = 1000; % um/us
    
 
    F = zeros(N+1,1);
    
    h = d / N; 
    a = D/h.^2;
    e = ( (2*D/(h * h)) + (k1 + k2 * ND) );
    c = D/h.^2;
    g= k2;
    
    F(1 ,1 ) = ( (((-2* a * h * SL) / D ) - e )* u(1,1) + (a+c)*u(2,1) - g * u(1,1).^2 );
    F(N+1 ,1 ) = ( (a+c) * u(N,1) -(e + ((2 * c * h * SR) / D )) * u(N+1,1) - g * u(N+1,1).^2   );
    
    for i=2 : N
        
        F(i ,1 ) =(a * u(i-1,1) - e * u(i,1) +c* u(i+1,1) -g* u(i,1).^2);
    end
    
    
%f=fd_nonlin([1,2,3,4,5]',4)