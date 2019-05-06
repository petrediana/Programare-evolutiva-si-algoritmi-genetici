function [ OK ] = este_fezabil( vector_bani, suma_de_plata, vector_de_bancnote )
    %verific fezabilitatea: daca pot sa platesc suma de bani data (trebuie ca
    %suma curenta sa fie mai mare sau egala cu suma de plata)

    %vectorul meu are 6 pozitii cu bancnotele romanesti
    suma_curenta = 0;
    for i = 1:6
        suma_curenta = suma_curenta + vector_bani(i) * vector_de_bancnote(i);
    end;

    OK = suma_curenta >= suma_de_plata;
end

