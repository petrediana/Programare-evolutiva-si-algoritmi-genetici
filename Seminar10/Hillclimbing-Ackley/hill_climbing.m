function [sol,val] = hill_climbing(n,a,b,MAX,eps)
%[sol,val] = hill_climbing(2,[-3 -3],[3 3],1000,1e-2)
%[sol,val] = hill_climbing(5,[-3 -3 -3 -3 -3],[3 3 3 3 3],1000,1e-3)

x = unifrnd(a,b,1,n);  %generez n elemente ale solutiei din intervalul [a b] ex: [-3 3]
vminc = Ackley(x,n); %calculez minimul functiei pentru punctul generat aleator
it = 1; %initializare contor pentru iteratii 
gata = 0; %flag pentru terminare
while it <= MAX && ~gata
    Nx = vecini1(x,n,eps,a,b);
    % Nx este matricea vecinilor cu nrv linii si n coloane
    % vecinul i: Nx(i,:)
    [nrv, ~] = size(Nx); %numarul de vecini
    valori = zeros(1,nrv); %initializez un vector cu nrv zerouri
    for i = 1 : nrv
        valori(i) = Ackley(Nx(i,:),n); %in care introduc valoarea Acley pentru fiecare vecin
    end
    [valmin, pozmin] = min(valori); %calculez minimul din vecini
    if valmin < vminc %daca minimul din vecini e mai mic decat minimul initial
        x = Nx(pozmin,:); %salvez in x (noul punct curent) solutia care da minimul
        vminc = valmin; %valoarea minia curenta devine noua valoare minima gasita
        it = it + 1; %am terminat o iteratie
    else
        gata = 1; %daca niciunul din vecini nu da o solutie mai buna, gata = 1 
        % => iese din while
    end
end
disp(it); %afisez iteratia la care s-a oprit algoritmul
%afisez solutia optima si valoarea Ackley pentru ea
sol = x; 
val = vminc;
disp(sol);
disp(val);
plot_Ackley_2D(a,b,n,sol,val) %afisez graficul
end