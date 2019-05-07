function [ OK ] = functia_fezabilitate( x, y, z, suma_de_investit )
    %aici presupun deja ca x, y, z sunt generate si le stiu
    %vad daca rezultatele sunt fezabile
    
    val = x + y + z;
    factor_risc = calcul_factor_risc(x, y, z);
    risc_maxim = 2.5;
    
    if val <= suma_de_investit && factor_risc < risc_maxim
        OK = true;
    else
        OK = false;
    end;


end

