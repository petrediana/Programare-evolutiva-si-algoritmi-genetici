function [ Pop ] = gen_pop(dim, cost, valoare, n, cmax)
%dim este numarul de indivizi din populatie
%cost si valoare sunt vectorii cu valorile aferente costuri si valorilor
%Pop variabila de iesire este Populatia generata

Pop = zeros(dim, n + 1);
%dim linii si n coloane pentru cote + o coloana pentru functia
%fitness(functia obiectiv)

max = 2 ^n -1;
%intregul maxim reprezentabil pe n biti
i = 1;

while i <= dim
    x = unidrnd(max);
    sir = bitget(x, n: -1: 1); %cum arata x pe n biti
    val = f_obiectiv(valoare, sir, n);
   %la momentul asta am un individ generat despre care nu stiu daca este
   %fezabil
   
   [OK] = este_fezabil(sir, cost, n, cmax);
   
   if( OK)
       Pop(i, 1 : n) = sir; %populez linia i a matricei parintilor cu cotele
       Pop(i, n + 1) = val; %pe ultima coloana salvez valoarea individului
       i = i + 1; %daca individul este ok trec la urmatoarea pozitie din matricea parintilor
   end
end


end

