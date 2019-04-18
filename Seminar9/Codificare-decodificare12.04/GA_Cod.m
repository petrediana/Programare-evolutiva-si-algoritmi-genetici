function [sol,val] = GA_Cod(dim,MAX,pc,pm,numeI,numeO)
% [sol,val] = GA_Cod(200,250,0.8,0.2,'intrari.txt','iesiri.txt');

%genereaza populatia initiala si calculeaza fitness-ul maxim
n=26;
[mesaj,cod,m] = preia_date(numeI);
disp(mesaj);
disp(cod);
Pop=gen_pop(dim,n,mesaj,cod,m);
fitmax=max(Pop(:,n+1));
valori_max=[fitmax];
it=1;
OK=1;
% OK=1 daca exista macar 2 valori ale functiei fitness in populatie
while it<=MAX && fitmax<1 &&OK
    % selectie parinti
     Parinti=selectie_SUS(Pop,dim,n);
     % recombinare
      O=crossover_pop(Parinti,dim,n,pc,mesaj,cod,m);
      %mutatie
       MO = mutatie_pop(O,dim,n,pm,mesaj,cod,m);
       %selectia generatiei urmatoare
       GenUrm = elitism(Pop,MO,dim,n);
       % numararea generatiilor cosecutive cu cel mai bun individ
       % aproximativ la fel de bun
       fitmax1=max(GenUrm(:,n+1));
       fitmin=min(GenUrm(:,n+1));
       OK= fitmin~=fitmax1;
       fitmax=fitmax1;
       valori_max= [valori_max fitmax];
       it=it+1;
       Pop=GenUrm; %ultima devinde initiala
end
 % Afisare rezultate
 figure
 x=1:length(valori_max);
 y=valori_max(x);
 plot(x,y,'--rs','LineWidth',1,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',8);
 title('Evolutia celui mai bun individ');
 disp('Cel mai bun individ:');
 [val,poz]=max(Pop(:,n+1)); sol=Pop(poz,1:n);
 disp(sol);disp(val);
 scrie_rezultate(sol,numeO);
end

