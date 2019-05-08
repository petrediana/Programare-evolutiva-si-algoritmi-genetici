function [O] =crossover_pop( P,dim, pc, matrice_cost_pachet )
    % indivizii parinti sunt aranjati in P aleator
    % recombinarea este realizata pentru perechi de parinti vecini
    O = P;
    n = 5;
    c=zeros(2,n);
    for i=1:2:dim-1
        p1=P(i,1:n);
        p2=P(i+1,1:n);
        r=unifrnd(0,1);
        if r<=pc
            disp(['Crossover intre parintii ' num2str(i) ' ' num2str(i+1)]);
            disp(P(i,:));
            disp(P(i+1,:));

            [c(1,:),c(2,:)]=crossover_unif(p1,p2); % - crossover discret

            disp('Rezulta');
            for j=1:2
                %if este_fezabil(c(j,:),cost,n,cmax)
                 if este_fezabil(c(j, :), matrice_cost_pachet)
                    disp(['Copilul ' num2str(j) ' fezabil:']);
                    O(i+j-1,1:n)=c(j,:);

                    %O(i+j-1,n+1)=f_obiectiv(val,c(j,:),n);
                    O(i+j-1,n+1) = functia_obiectiv(c(j, :));
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