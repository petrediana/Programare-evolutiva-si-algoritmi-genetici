cost = [8 12 6 10 6 16 10 14 12];
val = [3 2 1 7 4 9 10 21 12];
n = length(cost); %determin nr de obiecte
dim = 20; %nr de indivizi ai populatiei
cmax = 45; %costul maxim admis


%generez populatia 
Pop_init = gen_pop(dim, cost, val, n, cmax);

%determinarea celei mai bune solutii gasite
disp(['Valoarea maxima determinata: ' num2str(max(Pop_init(:, n + 1)))]);

pm = 0.1;
sigma = 0.3;

%mutez vechea populatie
PopM = mutatie_pop(Pop_init, dim, n, cost, val, cmax, pm, sigma);

disp(['Valoarea maxima determinata din populatia mutanta: ' num2str(max(PopM(:, n + 1)))]);

