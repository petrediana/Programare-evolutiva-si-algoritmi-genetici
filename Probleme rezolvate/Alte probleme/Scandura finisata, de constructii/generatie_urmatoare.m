function [ rezultat ] = generatie_urmatoare( P,desc )
    % selectarea elitista a generatiei noi 
    % I: P - populatia curenta, desc - descendentii generati
    %    pe ultima coloana se afla valoarea functiei obiectiv
    % E: rezultat - generatia noua

rezultat=P;
[dim,n]=size(P);
fctob=P(1:dim,n);
fctobN=desc(1:dim,n);
[max1,i]=max(fctob);
[max2,j]=max(fctobN);
if(max1>max2)
    [~,k]=min(fctobN);
    rezultat(k,1:n)=P(i,1:n);
end;
end

