function [sol,val] = GA_Regine(MAX,ni)
%% Exemple de apel
% [sol,val] = GA_Regine(150,20);
% [sol,val] = GA_Regine(250,20);
% [sol,val] = GA_Regine(350,40);
%ni este numarul de indivizi ce vor fi inlocuiti cu copii

n = 10; %numarul de regine 
dim = 200; %numarul de indivizi
pc = 0.7; %probabilitatea de Crossover (Recombinare) = 70%
pm = 0.05; %probabilitatea de Mutatie = 5%

%Generarea populatiei initiale si calculearea fitness-ului maxim
Pop = gen_pop(dim,n);
fitmax = max(Pop(:,n+1));
valori_max = [fitmax];
it = 1; %initializarea contorului pentru numarul de iteratii ale algoritmului GA
OK = 1; %daca exista macar 2 valori ale functiei fitness in populatie

while it <= MAX &&  fitmax<n*(n-1)/2 && OK  %fitmax<n*(n-1)/2 daca gaseste maximul teoretic se opreste
        % Selectia Parintilor
        Parinti = selectie_ruleta(Pop,dim,n);
        
        % Recombinarea Parintilor
        Copii = crossover_pop(Parinti,dim,n,pc);
        
        % Operatia de mutare a Populatiei de copii
        CopiiM = mutatie_pop(Copii,dim,n,pm);
        
        %Selectia generatiei urmatoare
        GenUrm = Genitor(Pop,CopiiM,dim,n+1,ni);
        
        % numararea generatiilor cosecutive cu cel mai bun individ
        % aproximativ la fel de bun
        fitmax1 = max(GenUrm(:,n+1)); %fitness-ul celui mai bun individ curent
        fitmin = min(GenUrm(:,n+1)); %fitness-ul celui mai slab individ curent
        OK = fitmin ~= fitmax1; %exista cel putin doua valori diferite intre fitness-uri
        
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
end

