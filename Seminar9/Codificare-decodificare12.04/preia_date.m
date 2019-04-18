function [mesaj,cod,m] = preia_date(nume_fis)
%mesaj -mesajul corect, fara litere duplicate
%cod - varianta codificata, fara litere duplicate
%m - numarul de litere diferite din mesaj

f = fopen(nume_fis); %deschidere fisier
a1=fscanf(f,'%s'); %preia cele 2 mesaje intr-un singur sir

nn = length(a1); %calculeaza lungimea totala a sirului rezultat
n = fix(nn/2); %gaseste jumatatea sirului

mesaj = int16(a1(1:n))-int16('a')+1;  %transforma literele in numere de la 1 la 26 (prin valoarea ASCII)
mesaj = unique(mesaj,'stable'); %eliminam dublurile pastrand ordinea
%prin stable le lasa in ordine, fara stable le si sorta

cod=int16(a1(n+1:nn))-int16('a')+1; %transforma literele in numere de la 1 la 26 (prin valoarea ASCII)
cod=unique(cod,'stable'); %eliminam dublurile pastrand ordinea

m=length(cod);
end

