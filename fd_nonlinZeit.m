function [t,dy]= fd_nonlinZeit(t,u)
%{
Eingabe:
u Vektor u der Große ¨ (N + 1) × 1
N Anzahl von Teilintervallen N.
Ausgabe:
F Vektor F(u) der Große ¨ (N + 1) × 1


%}

N = length (u);
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
    b = zeros(N+1,1);
    z = zeros(N+1,1);

    % z belegen
    for i = 1 : N +1
      z(i ,1 ) = h*(i-1) ;
      
    end
 
    %b belegen
    for i = 1:N+1 % 
         b(i , 1 ) =   sZeit( z(i,1) ); % hier leo Funktion
   end
 
    
    
    F(1 ,1 ) = ( (((-2* a * h * SL) / D ) - e )* u(1,1) + (a+c)*u(2,1) - g * u(1,1).^2 + b(1,1) );
    F(N+1 ,1 ) = ( (a+c) * u(N,1) -(e + ((2 * c * h * SR) / D )) * u(N+1,1) - g * u(N+1,1).^2 + b(N+1,1));
    
    for i=2 : N
        
        F(i ,1 ) =(a * u(i-1,1) - e * u(i,1) +c* u(i+1,1) -g* u(i,1).^2  + b(i,1));
    end
    
    dy = F;
%f=fd_nonlin([1,2,3,4,5]',4)