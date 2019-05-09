function [ y ] = fluaj( x,pm,a,b,t )
y=x;
r=unifrnd(0,1);
if r<pm
    q=normrnd(0,t/3);
    y=y+q;
    if y<a;
        y=a;
    end;
    if y>b
        y=b;
    end;
end;
end

