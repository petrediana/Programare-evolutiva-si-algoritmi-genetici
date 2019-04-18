function [valoare] = fitness(x,mesaj,cod,n) % n = 26 cate litere sunt in alfabet
val=0;
%x este individul
for i = 1:n
    ind = find(x == cod(i));
    val = val+ abs(double(mesaj(i)) - double(ind)); % costul
    %masor distanta dintre mesajul corect si mesajul individului
end
valoare=1.0/(double(val)+1);
end

