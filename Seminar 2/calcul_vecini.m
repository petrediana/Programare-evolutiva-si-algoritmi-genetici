function [nv] = calcul_vecini(v,a,b,k,eps)
% calculeaza vecinii punctului curent, dar include si punctul curent
% v este valoarea curenta a unctului generat aleator
% a si b sunt limitele intervalului din care se genereaza valorile pentru x
% si y
% k si eps sunt valorile pe baza crora se determina capetele intervalului
% in care se cauta vecinii
% folosim 2 parametri pentru ca dupa k intreg vom itera iar eps este folosit pt
% variatie 0.001

nv=[]; %vectorul in care vom salva vecinii si il si returnam ca var de iesire
vecin=zeros(1,2); %initializam cu zero un vector in care vom avea vecinul curent
for i=-k:k %iteram dupa x si dupa y
    for j=-k:k
        vecin(1)=v(1)+i*eps; %adaugam/scadem la valoarea curenta valorile din inetrvalul [-k;k] ori eps
        vecin(2)=v(2)+j*eps;
        %verificam sa ignoram vecinii care se afla in afara spatiului pe
        %care l-am definit pentru domeniul functiei [-2;2];
        if((vecin(1)>=a)&& (vecin(2)>=a) && (vecin(1)<=b) && (vecin(2)<=b))
            val=f_obiectiv(vecin(1),vecin(2)); %daca se respecta conditia calculam functia obiectiv pe baza celor doua valori
            nv=[nv;[vecin val]]; %adaugam la vectorul de vecini O NOUA LINIE (;) cu vecinul curent
        end;
    end;
end;
end

