function [ Populatia ] = generare_populatie_initiala( nr_indivizi )
    
    Populatia = zeros(nr_indivizi, 6 + 1);
    i = 1;
    while i < nr_indivizi
        individ_curent = zeros(1, 6);
        individ_curent(1:3) = unidrnd(121, 1, 3) - 1;
        %fabrica din bucuresti poate produce doar 120 de tone
        %pun 121 la unidrnd apoi scad 1 => poate produce si 0 astfel
        individ_curent(4:6) = unidrnd(141, 1, 3) - 1;
        %fabrica din craiova poate produce maxim 140 tone
        
        [OK] = este_fezabil(individ_curent);
        fitness = functia_obiectiv(individ_curent);
        if OK %daca e bun il arunc in populatie
            Populatia(i, 1:6) = individ_curent;
            Populatia(i, 6 + 1) = fitness;
            i = i + 1;
        end;
    end;
end

