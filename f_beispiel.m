function [y,dy] = f_beispiel(x)


    y = 1+0.12*sqrt(x)-x;
    dy = -1 + 0.06/sqrt(x);
end 