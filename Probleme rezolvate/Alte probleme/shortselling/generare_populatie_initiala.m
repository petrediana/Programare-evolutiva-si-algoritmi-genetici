function [pop] = generare_populatie_initiala(dim, n, Q, rmed, alpha, B, ro, Rp)
  % generarea populatiei initiale fara short selling
  % dim - nr indivizi
  % n - nr active
pop=zeros(dim, 2*n-1);
for i=1:dim
    x=zeros(1, n-1);
    for j=1:n
        gata=0;
        while(~gata)
            r=unifrnd(0,1);
            if(sum(x)+r<1)
                x(j)=r;
                gata=1;
            end
        end
        if(sum(x)==1)
            break;
        end
    end
    pop(i, 1:n-1)=x(1:n-1);
    pop(i, n:2*n-2)=unifrnd(0.25, 1,1,n-1);
    [val,V]=functie_obiectiv(Q,rmed,alpha,B,ro,Rp,(x(1:n-1))');
    pop(i, 2*n-1)=-val;
end
end

