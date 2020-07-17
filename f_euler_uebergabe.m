function [F,J] = f_euler_uebergabe(f,zi,ya)
    [F,J] = f(zi);
    J = J -jacobian(J,zi);
    F = F-(J*ya);
    
end