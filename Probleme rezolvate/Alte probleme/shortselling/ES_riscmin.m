function [x] = ES_riscmin(nume, dim, ro, Rp, NM, caz)
  % dim - dimensiunea populatiei
  % ro - relatia existenta intre riscul si randamentul portofoliului (din functia obiectiv)
  % Rp - randamentul sub care nu trebuie sa scada randamentul dat
  % NM - numarul de iteratii
  % caz - 0, pentru exemplul fara short selling
  % caz - 1, pentru exemplul cu short selling
 
if(caz==0)
    R=citeste_date(nume); % am citit rentabilitatile R
    [n,~]=size(R);
    [Q,rmed,alpha,B]=parametri(R); %aflam parametrii q, rmed, aplha si b dupa ce citim R
    pop=generare_populatie_initiala(dim,n,Q,rmed,alpha,B,ro,Rp); % generam fractiuni
   % disp(pop);% pop fara short selling
else
    n=5;
    In1=eye(n-1);
    ul=-ones(1,n-1);
    B=[In1; ul];
    alpha=zeros(n,1);
    alpha(n)=1;
    rmed=[-0.028, 0.366, 0.231, -0.24, 0.535]';
    Q=[1.0256 -0.4340 0.0202 -0.1968 -0.0311;
   -0.4340 1.1049 -0.0783 0.2347 -0.1776;
   0.0202 -0.0783 0.4328 -0.1236 -0.1895;
   -0.1968 0.2347 -0.1236 8.0762 1.0093;
   -0.0311 -0.1776 -0.1895 1.0093 2.9007];
   pop=generare_pop_short_selling(dim, n, Q, rmed, alpha, B, ro, Rp);
    %disp(pop); %generare pop short selling
end
dimc=7*dim;
tau=0.5/sqrt(2*sqrt(n));
taup=0.5/sqrt(2*n);
T=[];
T1=[]; % matrice/vector goala
% vector/matrici goale
for nrit=1:NM
    O=genereaza_copii(pop, dim, dimc, n, Q, rmed,alpha,B,ro,Rp);   
    % operatia de mutatie este realizata functie de caz - cu sau fara short selling
    m=mutatie(O, tau, taup, eps, dim, n, Q,rmed,alpha,B,ro,Rp);
    gen=generatia_urmatoare(O, dim, n);
    pop=gen;
    [val,V]=functie_obiectiv(Q,rmed,alpha,B,ro,Rp,pop(1:n-1,dim));  
    T=[T V];
    T1=[T1 val];
end;
disp(['riscul minim:' num2str(T(NM))]);
disp(['minimul functiei obiectiv MINRISC1:' num2str(T1(NM))]);
disp('Fractiunile investite');
disp([pop(1:n-1,dim);1-sum(pop(1:n-1,dim))]);
disp('Randamentul obtinut:');
Rr=(rmed.')*(alpha+B*pop(1:n-1,dim));
disp(Rr);
figure
i=1:NM;
plot(i,T1(i),'-rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','y',...
                'MarkerSize',8);
figure
i=1:NM;
plot(i,T(i),'-rs','LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','m',...
                'MarkerSize',8);
end

