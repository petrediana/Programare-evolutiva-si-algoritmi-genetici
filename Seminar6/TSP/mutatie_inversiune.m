function [p] = mutatie_inversiune(s,n)
%implementarea mutatiei prin inversiune

%generarea a doua pozitii aleatoare i<j
i=1;j=0; %caz de plecare ca sa intre in while
while (i>j)
    i=unidrnd(n-1); %i<j rezulta i nu poate lua ultima valoare a permutarii-elimin posibilitatea
    j=1+unidrnd(n-1); %i<j rezulta j nu poate lua prima valoare a permutarii-elimin posibilitatea
end
p=s;
p(i:j)=s(j:-1:i);

end

