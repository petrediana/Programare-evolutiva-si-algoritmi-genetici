function [ OK ] = este_fezabil(sir, cost, n, cmax)
% OK este un boolean in functie de fezibilitatea individului
% cost este vectorul de costuri
%cmax este costul maxim admis pt un individ (pt o solutie)

c = 0;
for j = 1 : n %pt fiecare obiect
    c = c+ sir(j) * cost(j);
end
OK  = c <= cmax;
end
