function [ y] = Ackley(x, n)
% functia de minimizat
%x este un vector cu n valori

sp = 0; %suma patratelor din formula
sc = 0; %suma cosinusurilor din formula

%calculeaza sumele pentru numarul de valori ale solutiei
for i = 1 : n
    sp = sp + x(i) ^ 2;
    sc = sc + cos(2 * pi *x(i));
end

%clculeaza intreaga functie 
y = -20 * exp(-0.2 * sqrt(sp / n)) - exp(sc / n) + 20 + exp(1);
end