cost = [8 12 6 10 6 16 10 14 12];
val = [3 2 1 7 4 9 10 21 12];
n = length(cost); %determin nr de obiecte
dim = 20; %nr de indivizi ai populatiei
cmax = 45; %costul maxim admis


%generez populatia 
Pop_init = gen_pop(dim, cost, val, n, cmax);

%Tema afisati valoarea celui mai bun individ
%cititi valorile pt cost si val din fisere txt