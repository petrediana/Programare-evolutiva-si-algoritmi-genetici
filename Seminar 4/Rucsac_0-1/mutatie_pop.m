function [ PM ] = mutatie_pop(P, dim, n, C, V, cmax, pm)
% PM este populatia returnata (mutanta)
%P este populatia initiala
%dim este nr de indivizi
%C, V sunt vectorii pentru cost si valoarea
%pm este probabilitatea de mutatie (in general foarte mica)

PM = P;

for i = 1 : dim % pentru fiecare individ
    p = PM(i, 1 : n); %salvez individul curent 
    %individul 1 si restul de coloane
    for j = 1 : n %pentru fiecare gena
        r = unifrnd(0, 1);
        
        if r < pm
            disp(['Este selectat individul: ' num2str(i) ' gena: ' num2str(j)]);
            disp(PM(i, 1: n)); %afisez individul inainte de mutatie
            
            pp = p; %salvez starea curenta a individului (pentru cazul in care nu este fezabil)
            
            %aplic mutatia pe gena j
            p(j) = mutatie_bianara(p(j));
            
            if este_fezabil(p, C, n, cmax);
                PM(i, 1 : n) = p; %salvarea individului mutant in noua populatie
                PM(i, n + 1) = f_obiectiv(V, p, n);
                disp('Noul individ rezultat: ');
                disp(PM(i, 1 : n));
            else
                p = pp; %revin la valorile dinainte de mutatie (pentru ca nu este fezabil)
                disp('Nu s a putut pastra individul mutant');
            end
        end
    end
end

                

end

