%function sz=s(z) mit Spaltenvektoren z und sz
function sz = s4(z,t)
 alfa = 10;
global s0; 
sz = s0.*(exp(-t).^2/(2.0*10.^2)))*(exp(-alfa*z));
end