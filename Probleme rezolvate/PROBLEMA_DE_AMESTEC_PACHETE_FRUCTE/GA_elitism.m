matrice_cost_pachet = load('matrice_cost_pachet.txt');
nr_indivizi = 50;
n = 5;

%Generarea populatiei initiale si calculearea fitness-ului maxim
Pop = generare_populatie_initiala( matrice_cost_pachet, nr_indivizi );
fitmax = max(Pop(:,n+1));
valori_max = [fitmax];
it = 1; %initializarea contorului pentru numarul de iteratii ale algoritmului GA
nrg = 0; %contor pentru determinarea generatiilor succesive care nu se schimba semnificativ
OK = 1; %daca exista macar 2 valori ale functiei fitness in populatie

MAX = 250;
NrG = 80;

while it <= MAX && nrg <= NrG && OK
    
    %Determin populatia de parinti
    Parintii = selectie_SUS(Pop, nr_indivizi);
    
    %Recombinarea parintilor
    Copii = crossover_pop(Parintii, nr_indivizi, pc,  matrice_cost_pachet);
    
    %Operatia de mutare a populatiei de copii
    CopiiM = mutatie_pop(Copii, nr_indivizi, 5, pm, sigma, matrice_cost_pachet);
    
     %Selectia generatiei urmatoare
     GenUrm = elitism(Pop,CopiiM, nr_indivizi, n);
     
        % numararea generatiilor cosecutive cu cel mai bun individ
        % aproximativ la fel de bun
        fitmax1 = max(GenUrm(:,n+1)); %fitness-ul celui mai bun individ curent
        fitmin = min(GenUrm(:,n+1)); %fitness-ul celui mai slab individ curent
        OK = fitmin ~= fitmax1; %exista cel putin doua valori diferite intre fitness-uri
        
        if abs(fitmax - fitmax1) < eps %daca diferenta intre maximul dintre Pop si GenUrm este f mica
           nrg = nrg + 1; %contorizez
        else 
           nrg=0; %daca exista diferente resetez contorul
        end
        
        fitmax = fitmax1; %Noul maxim al generatiei urmatoare este determinat
        valori_max = [valori_max fitmax]; %si concatenat in vectorul de valori_max
        it = it + 1; %incrementez numarul iteratiilor
        Pop = GenUrm; %reiau algoritmul cu populatia initiala fiind GenUrm
end

 %% Afisare rezultate
 figure
 x = 1 : length(valori_max);
 y = valori_max(x);
 plot(x,y,'--rs','LineWidth',2,...  %red line (r) with sqares(s)
                'MarkerEdgeColor','k',... %black edges
                'MarkerFaceColor','g',... %green faces
                'MarkerSize',10);
 title('Evolutia celui mai bun individ');
 
 %determinarea si afisarea celui mai bun individ dupa sfarsitul ultimei
 %iteratii a algoitmului GA
 disp('Cel mai bun individ:');
 [val,poz] = max(Pop(:,n+1)); 
 sol = Pop(poz,1:n);
 disp(sol);
 disp(['Valoarea: ' num2str(val)]);
