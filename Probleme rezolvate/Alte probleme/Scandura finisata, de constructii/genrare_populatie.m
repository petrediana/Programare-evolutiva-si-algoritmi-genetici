function [ P ] = genrare_populatie( dim )
P=zeros(dim,3);
i=1;
x=zeros(1,2);
while i<=dim
    x(1)=unifrnd(0,3);
    x(2)=unifrnd(0,4);
    if fezabil(x)
        P(i,1:2)=x;
        P(i,3)=fitness(x);
        i=i+1;
    end;
end;
end

