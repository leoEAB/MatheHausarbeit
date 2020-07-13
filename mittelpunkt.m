function [t,y] = mittelpunkt(f, tspan, ya, n)
    m = length(ya);
    t0 = tspan(1);
    tf = tspan(2);
    h = abs(tf - t0)/n; %Schrittbreite
    t = linspace(t0,tf,n+1); %Vcreate vector of t values
    y = zeros(m, n+1); %Speicherplatz für y
    k = zeros(m, 2); %Speicherplatz für k
    y(:,1) = ya'; % Initial Kondition
    for i=1:n
        k(:,1) = f(t(i), y(:,i));
        k(:,2) = f(t(i) + (h/2), y(:,i) + (h/2)*k(:,1));
        y(:,i+1) = y(:,i) + h*k(:,2);
    end
    t = t';y = y';
end