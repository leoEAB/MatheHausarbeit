function f = sZeit(t,z)
    global s0;
    alpha = 10^5;
    f = s0*exp(((-t.^2)/(2*0.01.^2))*exp(-alpha*z));
end