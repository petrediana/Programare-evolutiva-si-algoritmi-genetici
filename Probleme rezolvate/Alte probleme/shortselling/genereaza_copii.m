function [O] = genereaza_copii(pop, dim, dimc, n, Q,rmed,alpha,B,ro,Rp)
O=zeros(dimc,2*n-1);
for k=1:dimc
    xr=zeros(1,n-1);
    sigmar=zeros(1,n-1);
    %recombinare partea solutie - recombinare globala discreta
    %fiecare alela este calculata pe baza a doi parinti generati aleator
    for i=1:n-1
        poz=unidrnd(dim,1,2);
        rez=unidrnd(2);
        xr(i)=pop(poz(rez),i);
    end
    %recombinare parte parametrica din cromozom
    %recombinare globala intermediara
    %fiecare alela este calculata pe baza a doi parinti generati aleator
    for i=1:n-1
        poz=unidrnd(dim,1,2);
        sigmar(i)=(pop(poz(1),i)+pop(poz(2),i))/2;
    end
    copil = [xr sigmar];
    O(k,1:2*n-2)=copil;
    O(k,2*n-1)=functie_obiectiv(Q,rmed,alpha,B,ro,Rp,(O(k,1:n-1))');
end
end