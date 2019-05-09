function [ c1,c2 ] = arit_totala( p1,p2,alpha )
% - parintii(p1, p2), ponderea(alpha), copiii(c1, c2) 
[~,n]=size(p1);
c1(1:n)=alpha*p1(1:n)+(1-alpha)*p2(1:n);
c2(1:n)=alpha*p2(1:n)+(1-alpha)*p1(1:n);


end

