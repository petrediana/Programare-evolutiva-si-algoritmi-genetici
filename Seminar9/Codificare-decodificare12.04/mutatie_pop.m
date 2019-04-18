function [OM] = mutatie_pop(O,dim,n,pm, mesaj,cod,m)
OM=O;
for i=1:dim
    r=unifrnd(0,1);
    if r<=pm
        % efectueaza mutatiei prin interschimbare - specifica problemelor de
        % dependenta de adiacenta, cum este TSP
        OM(i,1:n)=mutatie_inter(OM(i,1:n),n);
        OM(i,n+1)=fitness(OM(i,1:n),mesaj,cod,m);
    end
end
end

