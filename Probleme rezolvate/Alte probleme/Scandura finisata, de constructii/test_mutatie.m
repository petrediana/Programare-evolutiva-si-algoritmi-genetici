function [ y ] = test_mutatie( x,dim, pm, t )
%x-individul asupra caruia se aplica mutatia, pm- probabilitatea de
%mutatie, a si b captele de interval, y individul obtinut

y=x;
z=zeros(1,2);
for i=1:dim
    z(1)=fluaj(y(i,1),1,3,t,pm);
    z(2)=fluaj(x(i,2),1,4,t,pm);
    if fezabil(z)==1
        y(i,1:2)=z;
        y(i,3)=fitness(y(z));
    end;
end;  
end

