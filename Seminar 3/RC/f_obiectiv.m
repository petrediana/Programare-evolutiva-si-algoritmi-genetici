function [ val ] = f_obiectiv(valoare, sir, n)
%valoarea este vectorul cu valorile obiectelor
%sir este individul curent
%n este numarul de obiecte

val = 0;
for i = 1 : n
    val = val + sir(i) * valoare(i); %suma produselor dintre cote si valori
end
end
