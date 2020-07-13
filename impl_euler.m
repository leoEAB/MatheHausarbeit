% Eingabe
% f     : Funktionshandle für f(t,y)
% tspan : Intervall [a,b]
% ya    : Anfangswert ya
% n     : Anzahl von Teilintervallen
% df    : Funktionshandle für D(y)f(t,y) bezüglich y
% tol   : Toleranz für Newton-Verfahren
% nmax  : maximale Anzahl an Schritten des Newton-Verfahrens
% Ausgabe
% t     : Vektor der Stützpunkte (t0,t1,...,tn) der Größe (n+1) x 1
% y     : Matrix der approximierierten Lösungswerte y(i) mit i= 0,...,n der
% Größe (n+1) x k

function [t,y] = impl_euler(f,tspan,ya,n,df,tol,nmax)
    k = length(ya);
    %Alocate memorys-space
    t = zeros(n+1,1);
    y = zeros(n+1,k);    
    z = zeros(k,1);
    x0 = ones(k,1);
    
    %Compute step-width h
    t0 = tspan(1);
    tf = tspan(2);
    h = abs(tf - t0)./n;
    
    %Compute t
    t = linspace(t0, tf, n+1)';
    
    %Initial condition
    y(1,:) = ya'; 

    
    for i=1:n
        [z,~,~] = newton(@(zi) F_euler(zi,t(i),h,y(i,:),f,df), x0, tol, nmax);
        y(i+1,:) = y(i,:) + z';
    end
    
    
end
