dim=70;
disp('Generare populatie:');
P = genrare_populatie(dim)
pop=sortrows(P,3);
P=pop;


disp('Selectam multimea de parinti: ');
parinti=selectie_turneu(P, 8)

alpha=0.2;
pr=0.8;
disp('Populatia recombinata');
popRecombinata=recombinare_populatie(parinti, dim, alpha,pr)

a=1;
b=3;
pm=1/70;
t=50;
disp('Mutatie: ');
popMutata = test_mutatie(popRecombinata,dim, pm, t);

disp('Generam populatia urmatoare: ');
rezultat = generatie_urmatoare(P,popMutata)
P=sortrows(rezultat,3);
maxim=max(P(1:dim,3));
for i=1:dim
    if(pop(i,3)==maxim)
        disp('Cantitatea de scandura 1: ');
        disp(round(pop(i,1)*1000));
        disp('Cantitatea de scandura 2: ');
        disp(round(pop(i,2)*1000));
    end;
end;



