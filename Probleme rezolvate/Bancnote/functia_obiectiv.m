function [ valoare] = functia_obiectiv( vector_de_bani )
    val = 0;
    for i = 1:6
        val = val + vector_de_bani(i);
    end;
    valoare = 1.0/(double(val));
end

