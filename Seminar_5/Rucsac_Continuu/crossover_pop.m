function [O] =crossover_pop(P,dim,n,pc,cost,val,cmax,alpha)
% indivizii parinti sunt aranjati in P aleator
% recombinarea este realizata pentru perechi de parinti vecini
O=P;
c=zeros(2,n); %matrice de copii cu 2 coloane, o linie
for i=1:2:dim-1
    p1=P(i,1:n); %extrag cei doi parinti
    p2=P(i+1,1:n);
    r=unifrnd(0,1); %generez o probabilitate de incrucisare
    if r<=pc %%pc este probabilitatea de crossover
        disp(['Crossover intre parintii ' num2str(i) ' ' num2str(i+1)]);
        disp(P(i,:));
        disp(P(i+1,:));
        %[c(1,:),c(2,:)]=crossover_mp(p1,p2,n,alpha); %- medie ponderata simpla
        %[c(1,:),c(2,:)]=crossover_singular(p1,p2,n,alpha); %- medie ponderata singulara
        [c(1,:),c(2,:)]=crossover_unif(p1,p2,n); % - crossover discret
        disp('Rezulta');
        for j=1:2 %pentru copilul 1 si copilul 2
            if este_fezabil(c(j,:),cost,n,cmax) %verific daca copii sunt fezabili
                disp(['Copilul ' num2str(j) ' fezabil:']);
                O(i+j-1,1:n)=c(j,:);
                O(i+j-1,n+1)=f_obiectiv(val,c(j,:),n);
                disp(O(i+j-1,:));
            else
                disp(['Copilul ' num2str(j) ' nu este fezabil. Este inlocuit cu parintele sau']);
            end;
        end;
    else
        disp('Recombinare asexuata'); %ambii parinti devin ei insisi copii
    end;
end;       
end

