function [ parinti ] = selectie_turneu(pop,k )
%I:pop-populatia curenta, k-nr de participanti la turneu
%pe ultima coloana e afla valoarea functiei obictiv
%  E: parinti- parinti selectati
[m,n]=size(pop);%matrice cu m linii si n coloane caree ia valoarea populatiei
parinti=zeros(m,n);
turneu=zeros(k,n);
for i=1:m
    for j=1:k
        t=unidrnd(m);
        if fezabil(pop)==1
        turneu(j,:)=pop(t,:);
        end;
    end;
    [~,p]=max(turneu(:,n));
    parinti(i,:)=turneu(p,:);
end;
end

