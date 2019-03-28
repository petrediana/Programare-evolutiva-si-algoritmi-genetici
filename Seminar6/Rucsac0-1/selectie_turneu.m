function [Parinti] = selectie_turneu(Populatie,dim,n)
Parinti=zeros(dim,n+1);
for i=1:dim
    p=unidrnd(dim,1,2);
    if Populatie(p(1),n+1)>Populatie(p(2),n+1)
        Parinti(i,:)=Populatie(p(1),:);
    else
        Parinti(i,:)=Populatie(p(2),:);
    end
end
end

