function [p] = mutatie_inter(s,n)
%implementarea mutatiei prin interschimbare

%generarea a doua pozitii aleatoare i<j
i=1;j=1;
while (i==j) %generez pana gasesc 2 diferite
    i = unidrnd(n);
    j = unidrnd(n);
end
p=s;
p(i)=s(j);
p(j)=s(i);

end
%prin interschimbare switch cele 2 elem
