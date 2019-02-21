function [] = exemplu_generare(m, n, x, y)

%generarea matrice aleatoare cu m linii si n coloane
%distributia uniforma pe [x, y]

a = unifrnd(x, y, m, n);
fitness = zeros(m, 1);

for i = 1 : m 
    for k = 1 : n
        fitness(i) = fitness(i) + a(i, k) ^ 2;
    end
end

%determinarea populatiei prin concatenarea matricei cu coloana fitness
populatie = [a fitness];

disp('Populatia generata si functia fitness: ');
disp(populatie);

%determinarea calitatii maxime din populatie si a individului corespunzator
[valoare_max, pozitie_max] = max(fitness);

%valoare_max -> salveaza valoarea maxima din fitness
%pozitie_max -> salveaza pozitia corespunzatore valorii maxime din fitness

disp('Calitatea maxima gasita este: ');
disp(valoare_max);

disp('Pozitia pe care se gaseste calitatea maxima este: ');
disp(pozitie_max);

individ = a(pozitie_max, :);

disp('Caracteristicile celui mai bun individ sunt: ');
disp(individ);



end

