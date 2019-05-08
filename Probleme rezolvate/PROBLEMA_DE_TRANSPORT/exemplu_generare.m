%am trecut deja in calculul functiei obiectiv costurile

dimensiune_pop = 50;

%generez populatia initiala
Populatia_initiala = generare_populatie_initiala(dimensiune_pop);

disp('Populatia initiala: ');
disp(Populatia_initiala);

disp(['Cel mai bun individ din populatia initiala: ' num2str(max(Populatia_initiala(:,6+1)))]);