function [pop] = generare_pop_short_selling(dim, n, Q, rmed, alpha, B, ro, Rp)
pop=zeros(n, 2*n-1); 
for i=1:n 
    x=zeros(1, n-1);
    gata=0;
    while(~gata)
        for j=1:n-1
            x(j)=unifrnd(-1,1);
        end
            if((sum(x)>=0)&&(sum(x)<=2))
              pop(i, 1:n-1)=x(1:n-1);
              pop(i, n:2*n-2)=unifrnd(0.25, 1,1,n-1);
              [val,V]=functie_obiectiv(Q,rmed,alpha,B,ro,Rp,(x(1:n-1))');
              pop(i, 2*n-1)=-val;
              gata=1;
            end
    end
end
end

