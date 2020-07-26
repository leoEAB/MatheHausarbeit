function [y,dy] =f(u,N,b)

y= fd_nonlin(u,N) -b ;
dy=fd_nonlin_jac(u,N);


end 