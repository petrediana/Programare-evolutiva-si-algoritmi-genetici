function [ valoare ] = functia_obiectiv( x, y, z)
    %profitul investitorului
    % uint64(number) -> pentru numere foooarte maaari
    
    profit_T1 = uint64(x * 0.04);
    profit_T2 = uint64(y * 0.09);
    profit_T3 = uint64(z * 0.06);
    
    valoare = uint64(profit_T1 + profit_T2 + profit_T3);

end

