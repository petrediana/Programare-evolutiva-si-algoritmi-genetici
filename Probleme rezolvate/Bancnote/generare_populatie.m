function [ populatie ] = generare_populatie(nr_indivizi, suma_de_plata, nr_max_bancnote, vector_de_bancnote)
    
    %am 6 bancnote: 5, 10, 50, 100, 200, 500 lei
    populatie = zeros(nr_indivizi, 6 + 1);
    i = 1;
    while i <= nr_indivizi
        %generez un individ
        individ = unidrnd(nr_max_bancnote + 1, 1, 6) - 1; % ca sa am acces si la 0 pentru ca unidrnd nu poate lua 0
        
        %verific daca a fost generat individul bine
        %generat bine = suma totala generata in individ sa fie >=
        %suma_de_plata
        f_obiectiv_curent = functia_obiectiv(individ);
        [OK] = este_fezabil(individ, suma_de_plata, vector_de_bancnote);
        if(OK) %daca e valid, il arunc in populatie
            populatie(i, 1:6) = individ;
            populatie(i, 6 + 1) = f_obiectiv_curent;
            i = i + 1;
        end;
    end;
end

