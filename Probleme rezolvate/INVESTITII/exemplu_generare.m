%EXEMPLU GENERARE SOLUTII

suma_de_investit = 100000;
nr_indivizi = 50;

%generez populatia initiala
Populatie_initiala = generare_populatie_initiala(suma_de_investit, nr_indivizi);

disp('Populatia initiala generata: ');
disp(Populatie_initiala);

%Determin populatia de parinti
Parintii = selectie_SUS(Populatie_initiala, nr_indivizi);

%Aplic crossover pe populatie
pc = 0.8;
Copii = crossover_pop(Parintii, nr_indivizi, pc, suma_de_investit);

% Aplicarea mutatiei pe populatia de copii
pm = 0.1;
sigma = 0.3;
CopiiMutati = mutatie_pop(Copii, nr_indivizi, 3, pm, sigma, suma_de_investit);

%Determinarea celor mai buni indivizi din populatii
disp(['Cel mai bun individ din populatia initiala: ' num2str(max(Populatie_initiala(:,3+1)))]);
disp(['Cel mai bun individ din populatia de parinti: ' num2str(max(Parintii(:,3+1)))]);
disp(['Cel mai bun individ din populatia de copii: ' num2str(max(Copii(:,3+1)))]);
disp(['Cel mai bun individ din populatia de copii mutati: ' num2str(max(CopiiMutati(:,3+1)))]);