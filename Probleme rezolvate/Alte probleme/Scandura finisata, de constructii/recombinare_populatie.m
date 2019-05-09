function [ popRecombinata ] = recombinare_populatie( P,dim,alpha,pr )
popRecombinata =P;
[~,n]=size(P);
for i=1:2:dim-1
    r=unifrnd(0,1);
    if r<pr
        [c1,c2]=arit_totala(popRecombinata(i,1:n-1),popRecombinata(i+1,1:n-1),alpha);
        if fezabil(c1)
            popRecombinata(i,1:n-1)=c1;
            popRecombinata(i,n)=fitness(c1);
        end;
        if fezabil(c2)
            popRecombinata(i+1,1:n-1)=c2;
            popRecombinata(i+1,n)=fitness(c2);
        end;
    end;
end;


end

