function [val] = fitness(p,fr,n)
%p = individul, fr = frecventele, n = nr linii/coloane harta
val = 0;
for i = 1 : n
    for j = 1 : n
    val = val + fr(i,j) * (1.7 + 3.4 * ((p(1) - i) ^ 2 + (p(2) - j) ^ 2) ^ 0.5);
    end
end
val = 1 / val; %transf problema de minim in problema de maxim
end

 
