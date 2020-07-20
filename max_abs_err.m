function [max_error] = max_abs_err(f,n,f_loesung)
    k = length(n);
    max_error = zeros(k,1);

    
   
    
    
    for i = 1:k
        [t, y] = f(n(i));
        max_error(i) = max(abs(y - f_loesung(t)));    
    end



end