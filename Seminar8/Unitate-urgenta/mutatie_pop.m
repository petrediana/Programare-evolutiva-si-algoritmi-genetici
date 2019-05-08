function [CopiiM] = mutatie_pop(Copii,dim,fr,pm,n)
CopiiM = Copii;
%Este parcursa O individ cu individ si fiecare individ este parcurs gena cu
%gena
for i = 1:dim
    p = CopiiM(i,1:2);
    for j = 1 : 2
        % verifica daca p, individul i, sufera mutatie in gena j
        r = unifrnd(0,1);
        if r <= pm
            % mutatia presupune generarea unei alte valori pentru gena -
            % problema cu date cardinale
            p(j) = unidrnd(n);
            CopiiM(i,1:2) = p;
            CopiiM(i,3) = fitness(p,fr,n);
        end
    end
end
end