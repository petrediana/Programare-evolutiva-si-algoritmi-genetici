function [c1,c2] = crossover_PMX(x,y,n)
p=unidrnd(n,1,2);
while p(1)>=p(2)
    p=unidrnd(n,1,2);
end
% x=[10 2 3 9 1 7 6 4 8 5];
% y=[5 4 7 2 1 9 3 6 8 10];
% n=10;
% p=[3 6];
% disp(p);
c1=PMX(x,y,n,p(1),p(2));
c2=PMX(y,x,n,p(1),p(2));
% disp(c2);
end

% 3 4 1 5 2
% 4 5 2 1 3
% p1 = 2 ; p2 = 4;


function c = PMX(x,y,n,p1,p2)
c=zeros(1,n);
c(p1:p2)=x(p1:p2);
% analiza secventei comune
for i=p1:p2
    a=y(i);
    if ~ismember(a,c)  %cand gasesc in parintele 2 un element din secventa comuna (SC) care nu e deja in copil
        %plasarea alelei a
        curent=i;
        plasat=0;
        while ~plasat
            b=x(curent);  %Pt fiecare element din SC din P1, sigur un element din el se gaseste in P2 pe o alta pozitie decat SC
            % cauta poz, pozitia pe care se afla b in y  
            poz=find(y==b);
            if ~c(poz)  %cand gaseste in P1 elementul care nu e in SC in P2, clar acesta va fi in P2 pe o pozitie necompletata inca din copil (deoarece copilul e completat cu SC din P1)
                c(poz)=a;
                plasat=1;
            else
                curent=poz;
            end
        end
    end
end %pana la acest pas se completeaza copilul cu elementele lipsa din SC ale lui P2 + urmeaza completarea celorlalte
% copierea alelelor din y inca necopiate in c                
for i=1:n
    if ~ismember(y(i),c)
        poz=find(c==0,1); %gaseste prima pozitie(1) care are valoarea 0 (c==0)
        c(poz)=y(i); %completeaza pozitia care are valoare zero cu valoarea din parintele 2 
    end
end
end

