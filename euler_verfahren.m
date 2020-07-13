% EULER_VERFAHREN zur Lösung von Anfangswertproblemen
%   [t,y] = EULER_VERFAHREN(f,tspan,y0,n)
%   Eingabe:
%       f       Funktion Handle auf Funktion dy=f(t,y) mit 
%               t       Skalar Zeit
%               dy,y    (k x 1) Vektor
%       tspan   Vektor mit Start- und Endzeit [a,b]
%       y0      (k x 1) Vektor mit Anfangswerten
%       n       Anzahl der Teilintervalle
%   Ausgabe
%       t       (n+1) x 1 Vektor der Zeitpunkte
%       y       (n+1) x k Matrix der Zustände, wobei in Zeile i die 
%               Komponenten zum Zeitpunkt i gespeichert sind
%
function [t,y]=euler_verfahren(f,tspan,y0,n)
    m = length(y0);
    t0 = tspan(1);
    tf = tspan(2);
    h = (tf - t0)/n; %Schrittbreite definieren
    t = linspace(t0, tf, n+1); %Vektor t erstellen
    y = zeros(m,n+1); %Speicher für y reservieren
    y(:,1) = y0'; % Initial bedingung
    for i=1:n
        y(:,i+1) = y(:,i) + h*f(t(i), y(:,i)); % Euler
    end
    
    t = t'; y = y'; %t und y werden zu spalten-vektoren konvertiert.
end