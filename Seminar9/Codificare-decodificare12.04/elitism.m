function [Pop_urm] =elitism(Pop_curenta,Copii,dim,n)
%presupunem ca dimensiunea populatiei de copii=dimensiunea populatiei la
%momentul curent
Pop_urm=Copii;
[val1,i1]=max(Pop_curenta(:,n+1));
[val2,~]=max(Copii(:,n+1));  % copii mutanti
if(val1>val2)
    best=Pop_curenta(i1,:);
    ind=unidrnd(dim);
    Pop_urm(ind,:)=best;
end
end
% selectia generatiei urmatoare
