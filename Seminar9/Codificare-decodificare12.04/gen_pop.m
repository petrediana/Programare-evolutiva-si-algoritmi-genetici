function [Pop]=gen_pop(dim,n,mesaj,cod,m)
% corespondenta alfabet mesaj corect- alfabet mesaj codificat: permutari cu
% m=26 elemente
% n - numarul de litere din mesaj
Pop=zeros(dim,n+1);
for i=1:dim
    Pop(i,1:n)=randperm(n);
    Pop(i,n+1)=fitness(Pop(i,1:n),mesaj,cod,m);
end
end
