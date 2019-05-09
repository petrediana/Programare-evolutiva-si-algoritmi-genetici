function [Q,rmed,alpha,B]=parametri(R)
% n actiuni observate in m saptamani
% generam Q, rmed, aplha, B

[n,m]=size(R); % n, m extrag dimensiunea matricei de rentabilitati R
rmed=zeros(n,1);
for i=1:n
    rmed(i)=mean(R(i,:)); % rmed se calculeaza ca medie dintre reantabilitatile de pe linia i
end;
Q=cov(R')*(m-1)/m; 
In1=eye(n-1); 
ul=-ones(1,n-1);
B=[In1; ul]; 
alpha=zeros(n,1); % alpha este o matrice de zerouri cu n linii si o coloana 
alpha(n)=1;
end