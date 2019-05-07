function [ PM ] = mutatie_pop( Populatia , nr_indivizi, n, pm, sigma, suma_de_investiti )
    %PM este populatia returnata (mutanta)

    %P este popualtia initiala
    %dim este nr de indivizi
    %pm este probabilitatea de mutatie (in general f mica)

    PM = Populatia;

    for i = 1 : nr_indivizi %pt fiecare individ
        p = PM(i,1:n); %salvez individul curent
        for j = 1 : n  %pt fiecare gena

            r = unifrnd(0,1);

            if r < pm
                disp(['Este selectat individul ' num2str(i) ' gena ' num2str(j)]);
                disp(PM(i, 1:n)); %afisez individul inainte de mutatie

                pp = p; %salvez starea curenta a individului (in caz ca dupa mutatie nu respecta costul maxim)

                %aplic mutatia pe gena j
                p(j) = mutatie_fluaj(p(j), sigma);

                
                 if functia_fezabilitate(p(1), p(2), p(3), suma_de_investiti)   
                    PM(i, 1:n) = p; %salvarea individului mutant in noua populatie
                    PM(i, n+1) = functia_obiectiv(p(1), p(2), p(3));
                    disp('Noul individ rezultat: ');
                    disp(PM(i, 1:n));
                else
                    p = pp; %revin la valorile dinainte de mutatie (pt ca nu e fezabil)
                    disp('Nu s-a putut pastra individul mutant');
                end
            end
        end
    end
end