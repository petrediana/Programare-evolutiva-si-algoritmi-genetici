function [O] = crossover_pop( Populatie, nr_indivizi, pc, suma_de_investit )
    % indivizii parinti sunt aranjati in P aleator
    % recombinarea este realizata pentru perechi de parinti vecini
    O = Populatie;
    n = 3;
    c=zeros(2,n);
    for i=1:2:nr_indivizi-1
        p1=Populatie(i,1:n);
        p2=Populatie(i+1,1:n);
        r=unifrnd(0,1);
        if r<=pc
            disp(['Crossover intre parintii ' num2str(i) ' ' num2str(i+1)]);
            disp(Populatie(i,:));
            disp(Populatie(i+1,:));

            [c(1,:),c(2,:)]=crossover_unif(p1,p2); % - crossover discret

            disp('Rezulta');
            for j=1:2
                %if este_fezabil(c(j,:),cost,n,cmax)
                if functia_fezabilitate(c(j, 1), c(j, 2), c(j, 3), suma_de_investit)
                    disp(['Copilul ' num2str(j) ' fezabil:']);
                    O(i+j-1,1:n)=c(j,:);

                    %O(i+j-1,n+1)=f_obiectiv(val,c(j,:),n);
                    O(i+j-1,n+1) = functia_obiectiv(c(j, 1), c(j, 2), c(j, 3));
                    disp(O(i+j-1,:));
                else
                    disp(['Copilul ' num2str(j) ' nu este fezabil. Este inlocuit cu parintele sau']);
                end;
            end;
        else
            disp('Recombinare asexuata');
        end;
    end;       
end