function [y,dy] =fTest(u,N,b)

y= fd_nonlinTest(u,N) -b ;
dy=fd_nonlin_jacTest(u,N);


end 