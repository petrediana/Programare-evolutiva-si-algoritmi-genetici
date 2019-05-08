matrice_cost_pachet = load('matrice_cost_pachet.txt');
nr_indivizi = 50;

%generez populatia initiala
Populatie_initiala = generare_populatie_initiala( matrice_cost_pachet, nr_indivizi );

%Determin populatia de parinti
Parintii = selectie_SUS(Populatie_initiala, nr_indivizi);

%Aplic crossover pe populatie
pc = 0.8;
Copii = crossover_pop(Parintii, nr_indivizi, pc,  matrice_cost_pachet);

% Aplicarea mutatiei pe populatia de copii
pm = 0.1;
sigma = 0.3;
CopiiMutati = mutatie_pop(Copii, nr_indivizi, 5, pm, sigma, matrice_cost_pachet);

disp(['Cel mai bun individ din populatia initiala: ' num2str(max(Populatie_initiala(:,5+1)))]);
disp(['Cel mai bun individ din populatia de parinti: ' num2str(max(Parintii(:,5+1)))]);
disp(['Cel mai bun individ din populatia de copii: ' num2str(max(Copii(:,5+1)))]);
disp(['Cel mai bun individ din populatia de copii mutati: ' num2str(max(CopiiMutati(:,5+1)))]);