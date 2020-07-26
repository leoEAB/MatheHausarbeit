function sz = sTestlineare(z)


D = 0.3;    % um^2/us


alpha = 10; % 1/um
k1 = 1.0;  % 1/us
k2 = 0.01;   % um/us
ND = 1000; % 1/um^3

k = (k1 + (k2 * ND));



global s0;

for i= 1 : length(z)
    
    sz (i) = (- 2 * D )+ (k * z(i)^2) + k ; % U(z)=Z^2 +1 für Test
    
end












%{

for i= 1 : length(z)
    
    sz (i) = (- 2 * D )+ (k * z(i)^2) + k ; % U(z)=Z^2 +1 für Test
    
end

//////////////////////////


global s0;

for i= 1 : length(z)
sz (i) = s0 *  exp(-1 * alpha * z(i) )

end

///////////////////////////


for i= 1 : length(z)
    
    sz (i) = z(i) * z(i) + 1;
    
end

/////////////////////////////

s0 =[10^2 10^3 10^4] ;%1/um^3 us
for i= 1 : length(z)
    
    for y=1 : 3
    
    sz (i) = s0(y) *  exp(-1 * alpha * z(i) );
    
    end
    
end



%} 
