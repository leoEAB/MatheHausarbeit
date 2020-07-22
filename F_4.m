function [t,dy]= F_4(t,u)
N = length(u);
d = 0.3;
h = d/N;
D = 0.3;    
sl = 0.1;
sr = 1000;
K = 11;
k2 = 0.01;
z_tief = linspace(0,0.3,N);
sz = s(z_tief,t);
dy(1) = -(2*D/h.^2 + K + 2*sl/h)*u(1) + (2*D/h.^2)*u(2) - (k2)*u(1).^2 + sz(1);
for i = 2 : length(u)-1
dy(i) = -(2*D/h.^2 + K)* u(i) + (D/h.^2)* u(i+1) + (D/h.^2)*u(i-1) - (k2)*u(i).^2 + sz(i);
end
dy(N) = -(2*D/h.^2 + K + 2*sr/h)* u(N) + (2*D/h.^2)*u(N-1) - (k2)*u(N).^2 + sz(N);
dy = dy';
end