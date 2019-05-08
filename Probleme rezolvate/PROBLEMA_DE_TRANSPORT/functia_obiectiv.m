function [ cost_min ] = functia_obiectiv( individ )
    
    valoare = (individ(1) * 50 + individ(2) * 70 + individ(3) * 90 + individ(4) * 60 + individ(5) * 70 + individ(6) * 100);
    valoare = valoare / 10000;
    
    cost_min = 1 / valoare;

end

