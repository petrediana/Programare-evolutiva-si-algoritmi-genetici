n=8;
dim=100;

%Generarea populatiei initiale
Popini=gen_pop(dim,n);

%Determinarea populatiei de parinti
Parinti = selectie_ruleta(Popini,dim,n);
%Parinti = selectie_SUS(Popini,dim,n);  %cu selectie SUS
%Parinti = selectie_turneu(Popini,dim,n);  %cu selectie turneu


% Aplicarea crossover (incrucisarii) pe populatie
pc=0.8;
Copii = crossover_pop(Parinti,dim,n,pc);

% Aplicarea mutatiei pe populatia de copii
pm = 0.1;
CopiiMutati = mutatie_pop(Copii, dim, n, pm);


%Determinarea celor mai buni indivizi din populatii
disp(['Cel mai bun individ din populatia initiala: ' num2str(max(Popini(:,n+1)))]);
disp(['Cel mai bun individ din populatia de parinti: ' num2str(max(Parinti(:,n+1)))]);
disp(['Cel mai bun individ din populatia de copii: ' num2str(max(Copii(:,n+1)))]);
disp(['Cel mai bun individ din populatia de copii mutati: ' num2str(max(CopiiMutati(:,n+1)))]);

%Afisarea valorilor de fitness pentru fiecare populatie
figure
stem(Popini(:,end));
title('Fitness-ul populatiei initiale'); 

figure
stem(Parinti(:,end));
title('Fitness-ul parintilor generati'); 

figure
stem(Copii(:,end));
title('Fitness-ul copiilor'); 

figure
stem(CopiiMutati(:,end));
title('Fitness-ul copiilor mutanti'); 