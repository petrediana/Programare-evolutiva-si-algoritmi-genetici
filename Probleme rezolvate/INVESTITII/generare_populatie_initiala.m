function [ Populatie ] = generare_populatie_initiala( suma_de_investit, nr_indivizi )

    % am 3 coloane, pt x, y, z [sumele investite] si ultima pt functia
    % obiectiv
    Populatie = zeros(nr_indivizi, 3 + 1);
    
    i = 1;
    while i < nr_indivizi
        individ = unidrnd(suma_de_investit + 1, 1, 3) - 1; %iau individul ca pe un vector de dimensiune 3 fiecare pozitie reprezentand suma de investit
        [OK] = functia_fezabilitate(individ(1), individ(2), individ(3), suma_de_investit);
        f_obiectiv_curenta = functia_obiectiv(individ(1), individ(2), individ(3));
        
        if OK %daca e valid il arunc in populatie
            Populatie(i, 1:3) = individ;
            Populatie(i, 3 + 1) = f_obiectiv_curenta;
            i = i + 1;
        end;
    end;
            
end

