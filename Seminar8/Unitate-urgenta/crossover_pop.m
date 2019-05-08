function [O] = crossover_pop(P,dim,fr,pc,n)
O=P;
for i=1:2:dim-1
     p1 = P(i,1:2);
     p2 = P(i+1,1:2);
     r = unifrnd(0,1);
     if r <= pc
        [c1,c2] = crossover_unipunct(p1,p2);  % - crossover unipunct
        O(i,1:2) = c1; 
        O(i,3) = fitness(c1,fr,n);
        O(i+1,1:2) = c2;
        O(i+1,3) = fitness(c2,fr,n);
    end
end       
end

