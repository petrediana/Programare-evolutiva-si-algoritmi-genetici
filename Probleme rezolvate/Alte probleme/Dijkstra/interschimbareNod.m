function G = interschimbareNod(G,a,b)

% interschimbare elementului de pe coloana a cu cel de pe coloana b

aux=G(:,a);
G(:,a)=G(:,b);
G(:,b)=aux;

% interschimbare elementului de pe linia a cu cel de pe linia b
aux=G(a,:);
G(a,:)=G(b,:);
G(b,:)=aux;

end