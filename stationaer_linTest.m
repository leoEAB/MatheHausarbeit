function [z,u]=stationaer_linTest(s,N)
%{
Eingabe:
s Funktionshandle auf Funktion s(z)
function sz=s(z) mit Spaltenvektoren z und sz
N Anzahl von Teilintervallen N.
Ausgabe:
z Knotenpunkte (z0, z1, . . . , zN ) der Große ¨ (N + 1) × 1
u Vektor u der Große ¨ (N + 1) × 1
%}

d = 0.3; % um
D = 0.3;
h = d/N;   
c = D/h.^2;


b = zeros(N+1,1); 
z = zeros(N+1,1);
u = zeros(N+1,1);
    
    


% z belegen
    for i = 1 : N +1
      z(i ,1 ) = h*(i-1) ;
      
    end
 
% s(z) belegen
   % sz = @s;    
    
 % sz = s(z);
   

% A imponieren   
    %A = spdiags( N + 1, N + 1 );

    A = fd_lin_matrixTest(N);
  
    
    
 % b belegen
    
   for i = 1:N+1 % 
         b(i , 1 ) =  - sTestLineare( z(i,1) ); % 
   end
 
 
 

 % u belegen
 %u = mldivide(A,b);
   u = A\b;
    
    
    
    
    
   