function [O] =crossover_pop(P,dim,n,pc,mesaj,cod,m)
% indivizii parinti sunt aranjati in P aleator
% recombinarea este realizata pentru perechi de parinti vecini
O=zeros(dim,n+1); % O = P
c=zeros(2,n);
for i=1:2:dim-1
    p1=P(i,1:n);
    p2=P(i+1,1:n);
    r=unifrnd(0,1);
    if r<=pc
        [c(1,:),c(2,:)]=crossover_OCX(p1,p2,n); % - crossover OCX
        for j=1:2
            O(i+j-1,1:n)=c(j,:);
            O(i+j-1,n+1)=fitness(c(j,:),mesaj,cod,m);
        end
    else 
        %DISP();
        O(i,:)=P(i,:);
        O(i+1,:)=P(i+1,:);
    end
end     
end

