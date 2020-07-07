% Newton-Verfahren für nichtlineare Gleichungssysteme 
%
%   [x, fval, exitflag] = newton(f, x0, tol, nmax)
%
% Beim Newton-Verfahren soll mindestens ein Schritt durchgeführt werden
% und die Iteration abgebrochen werden, falls für die k-te Iterierte x_k
%
% 	|| f(x_k) || + || x_k - x_(k-1) || < tol
%
% gilt. Hier ist ||.|| die (euklidsche) Länge eines Vektors. Rückgabewert 
% ist dann x_k ansonsten x_nmax.
%
% Eingabe:
%   f        Funktionshandle auf Funktionshandle [y,dy] = f(x)
%				Eingabe:
%					x 	Spaltenvektor der Unbekannten
%				Ausgabe:
%					y	Spaltenvektor des Funktionswertes an x
%					dy 	Jacobi-Matrix an x
% 	x0 		 Spaltenvektor des Startwerts x_0
% 	tol 	 Toleranz 
% 	nmax 	 maximale Anzahl an Iterationen bis Abbruch
%
% Ausgabe
% 	x 		 Spaltenvektor der näherungsweisen Nullstelle
% 	fval 	 Spaltenvektor des Funktionswertes an x
% 	exitflag Rückgabewert 1 falls Iteration Toleranzbedingung erfüllt hat 
%            ansonsten 0
%
function [z, fval, exitflag] = newton2(f,df,ti,h,yi,z0,tol,nmax)
    
    exitflag = 0;
    m = length(z0);
    nmax
    z_inter = zeros(m, nmax + 1);
    z_inter(:,1) = z0;
    delta = zeros(m, nmax-1);
    [fval, J] = F_euler(z_inter(:,1),ti,h,yi,f,df);
    for i = 2 : nmax+1
        delta(:,i-1) = J\-fval;
        z_inter(:,i) = z_inter(:,i-1) + delta(:,i-1);
        [fval, J] = F_euler(z_inter(:,i),ti,h,yi,f,df);
        z = z_inter(:,i);
        if(norm(fval) + norm(z_inter(:,i) - z_inter(:,i-1)) < tol)
            exitflag = 1;
            break;
        end
    end
end