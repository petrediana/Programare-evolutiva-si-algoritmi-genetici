function [Pop] = gen_Ackley(n,dim,a,b)
% Functia Ackley - generarea populatiei initiale
% generarea populatiei initiale pentru optimizarea - maximizarea functiei 1/(1+Ackley) 
% Ackely este functie de n argumente numere reale
% fiecare componenta a cromozomului este un numar real in [a(i),b(i)]

Pop = zeros(dim, n+1);
for i = 1 : dim
    %generarea individului i
    for j = 1 : n
        Pop(i,j) = unifrnd(a(j), b(j)); %fiecare gena se obtine prin generare aleatoare din inetrval
    end
    Pop(i,n+1) = 1 / (1 + Ackley(Pop(i,1:n),n)); %fitnessul
    %problema de minim se transforma in problema de maxim
    %stiu ca solutia optima este in [0 0 ... 0] cu rezultat 0 deci valoarea
    %maxima a fitnessului va fi 1
end
end

