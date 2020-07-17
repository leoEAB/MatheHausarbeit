y0 = [1;0;0];
tspan = [0 1];
n = 10;
dy = @(t,y) [y(1)+10*y(2)*y(3);
           4*y(1)-10*y(2)*y(3)-3*y(2)^2;
           3*10^7*y(2)^2];
       
tol = 10^(-15);
nmax = 1000;
y0 = [1;0;0];
[t,y_out] = impl_euler(@f_chem,tspan,y0,n,@f_chem_jac, tol, nmax);
plot(t,y_out, '-o')