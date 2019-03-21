function [c1,c2] =crossover_singular(x,y,n,alpha)
%se va modifica o singura gena
c1=x;
c2=y;
%alpha -> cota, cu cat modific gena
poz=unidrnd(n);
c1(poz)=alpha*x(poz)+(1-alpha)*y(poz);
%iau alpha (%) din X si (1 - alpha) (%) din Y
c2(poz)=alpha*y(poz)+(1-alpha)*x(poz);

end

