function [ populatie ] = generare_populatie_initiala( matrice_cost_pachet, nr_indivizi )

    populatie = zeros(nr_indivizi, 5 + 1);
    i = 1;
    
    while i <= nr_indivizi
        %individ = [unidrnd(833) unidrnd(400) unidrnd(500) unidrnd(300) unidrnd(250)];        
        individ = [unidrnd(1666) unidrnd(800) unidrnd(1000) unidrnd(600) unidrnd(500)]; 
        
        OK = este_fezabil(individ, matrice_cost_pachet);
        fitness = functia_obiectiv(individ);
        
        if OK
            populatie(i, 1:5) = individ;
            populatie(i, 6) = fitness;
            i = i +1;
        end;
    end;
end

