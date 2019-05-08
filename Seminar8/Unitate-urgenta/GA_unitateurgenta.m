function [sol,val,Pop] = GA_unitateurgenta(numefr,dim,MAX,pc,pm)
% numefr - numele fisierului in care sunt pastrate frecventele

%[sol,val, Pop] = GA_unitateurgenta('frecventa.txt',20,30,0.7,0.1)

% Implementare
fr = load(numefr); %citire matrice de frecvente
[n,~] = size(fr); %determinare dimensiune

%genereaza populatia initiala si calculeaza fitness-ul maxim
Pop = gen_pop(dim,fr,n);
fitmax = max(Pop(:,3));
valori_max = [fitmax];
it = 1;
OK = 1;
% OK=1 daca exista macar 2 valori ale functiei fitness in populatie
while it<=MAX && OK
      % selectie parinti
      Parinti = selectie_SUS(Pop,dim);
      % recombinare
      Copii = crossover_pop(Parinti,dim,fr,pc,n);
      %mutatie
      CopiiM = mutatie_pop(Copii,dim,fr,pm,n);
      %selectia generatiei urmatoare
      GenUrm = elitism(Pop,CopiiM,dim);
      % numararea generatiilor cosecutive cu cel mai bun individ
      % aproximativ la fel de bun
      fitmax1 = max(GenUrm(:,3));
      fitmin = min(GenUrm(:,3));
      OK = fitmin ~= fitmax1;
      fitmax = fitmax1;
      valori_max = [valori_max fitmax];
      it = it + 1;
      Pop = GenUrm;
end
 % Afisare rezultate
 figure
 x = 1:length(valori_max);
 y = 1./valori_max(x);
 plot(x,y,'--rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',10);
 title('Evolutia celui mai bun individ');
 disp('Cel mai bun individ:');
 [val,poz] = max(Pop(:,3)); sol=Pop(poz,1:2);
 val = 1/val;
 disp(sol);
 disp(['Valoarea:' num2str(val)]);
end

