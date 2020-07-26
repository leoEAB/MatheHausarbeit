function sz = sTestNichtlinear(z)


D = 0.3;    % um^2/us


alpha = 10; % 1/um
k1 = 1.0;  % 1/us
k2 = 0.01;   % um/us
ND = 1000; % 1/um^3

k = (k1 + (k2 * ND));



global s0;

for i= 1 : length(z)
    
    sz (i) = (- 2 * D )+ (k1 * z(i)^2) + (k2 * ND * z(i)^2 ) + k1 + (k2 * ND) + (k2 * z(i)^2 )+ k2  ; % U(z)=Z^2 +1 für Test   
    
end
