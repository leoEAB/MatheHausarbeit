function J= F_4_jac(t,u)
N = length(u);
d = 0.3;
h = d/N;
D = 0.3;    
sl = 0.1;
sr = 1000;
K = 11;
k2 = 0.01;
J(1,1) = -(2*D/h^2+K+2*sl/h) - 2*k2*u(1);
J(1,2) = 2*D/h.^2;
for i = 2 : length(u)-1
    J(i,i-1) = D/h.^2;
    J(i,i)   = -(2*D/h.^2 + K) - 2*k2*u(i);
    J(i,i+1) = D/h.^2;
end
J(N,N-1) = (2*D/h.^2);
J(N,N) = -(2*D/h.^2 + K + 2*sr/h) - (2*k2)*u(N); 
 bin = spdiags(J);
 c = [-1,0,1];
 J = spdiags(bin,c,J);
end