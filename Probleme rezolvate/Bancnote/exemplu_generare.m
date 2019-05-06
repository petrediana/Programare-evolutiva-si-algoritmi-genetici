vector_de_bancnote = [ 5 10 50 100 200 500];
nr_indivizi = 50;
nr_max_bancnote = 5;
suma_de_plata = 3800;
n = 6;
%generez populatia initiala
populatia_initiala = generare_populatie(nr_indivizi, suma_de_plata, nr_max_bancnote, vector_de_bancnote);

disp('Populatia initiala: ');
disp(populatia_initiala);

%Determin populatia de parinti
Parintii = selectie_SUS(populatia_initiala, nr_indivizi);

%Aplic crossover pe populatie
pc = 0.8;
Copii = crossover_pop(Parintii, nr_indivizi, pc,  suma_de_plata, vector_de_bancnote);
disp('Copilasii rezultati');
disp(Copii);

% Aplicarea mutatiei pe populatia de copii
pm = 0.1;
sigma = 0.3;
CopiiMutati = mutatie_pop(Copii, nr_indivizi, 6, pm, sigma, suma_de_plata, vector_de_bancnote);
disp('Mutez copilasii:');
disp(CopiiMutati);


%Determinarea celor mai buni indivizi din populatii
disp(['Cel mai bun individ din populatia initiala: ' num2str(max(populatia_initiala(:,n+1)))]);
disp(['Cel mai bun individ din populatia de parinti: ' num2str(max(Parintii(:,n+1)))]);
disp(['Cel mai bun individ din populatia de copii: ' num2str(max(Copii(:,n+1)))]);
disp(['Cel mai bun individ din populatia de copii mutati: ' num2str(max(CopiiMutati(:,n+1)))]);

