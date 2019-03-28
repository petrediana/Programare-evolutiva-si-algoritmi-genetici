function [val]=f_obiectiv(valoare,sir,n)
% functia obiectiv din problema rucsacului 
% valore - vectorul cu valorile meritului selectarii fiecarui obiect
% sir - sirul de numere reale care reprezinta individul (gena i are valoarea egala cu fractiunea selectata din obiectul i
% n=length(sir);
% sir = individul 

val=0;
for i=1:n %se cumuleaza produsele dintre valoarea fiecarei alele cu corespondentul valorii din vectorul de valori
    val=val+sir(i)*valoare(i);
end;
end
