function A = fd_lin_matrixTest(N)


    d = 0.3;    % um
    D = 0.3;    % um^2/us
    k1 = 1.0;  % 1/us
    k2 = 0.01;   % um/us 
    ND = 1000; % 1/um^3
   
  SL = 0;  % um/us     Test
  SR = (-2 * D * d)/(d.^2 +1); % um/us     Test
    
    
    k = (k1 + (k2 * ND));
    
    
 
    
 %  A = spdiags( N + 1, N + 1 );
   A = zeros(N+1,N+1);
    
    h = d / N;
    
    
    a = D/h.^2;
    e = ( (2*D/(h * h)) + k );
    c = D/h.^2;
    
    
    
    
    A(1, 1) = (((-2* a * h * SL) / D ) - e ); 
   % A(1, 1) = - e ; % test 
    A(1, 2) = a + c;
    
    
    A(N + 1 , N) = a + c ;
   A(N + 1, N + 1) = -(e + ((2 * c * h * SR) / D )) ; 
    %A(N + 1, N + 1) = -e; %test
        
    for i = 2 : N 
    
        A(i, i - 1) = a ;
        

        A(i, i ) =  - e ; % hier
       
        
        A(i, i + 1) = c ;
       
        
    end
    
     bin = spdiags(A);
    c = [-1,0,1];
    A = spdiags(bin,c,A);
    
    
end