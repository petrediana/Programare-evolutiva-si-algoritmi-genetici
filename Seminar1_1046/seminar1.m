function [] = seminar1(matrice, vector, p, m, n)

%incarcarea matricei
a1 = load(matrice);
disp('Matricea citita este: ');
disp(a1);


%functia size
%primul nr de linii, dupa nr de coloane
%daca nu ma intereseaza nr de coloane pun ~
[L, ~] = size(a1);
disp('Nr de linii: ');
disp(L);

%incarcarea vectorului din fisier
v = load(vector);

%produsul dintre matrice si vector
rez1 = a1 * v;
disp('Afisare produs matrice si vector: ');
disp(rez1);


%ridicarea la patrat a matricei
a2 = a1 ^ p;
disp('Matricea la puterea p: ');
disp(a2);

%copierea ultimei linii/ultimei coloane a matricei
x = a1(L, :);
disp('Afisarea ultimei linii a matricei: ');
disp(x);

y = a1(:, L);
disp('Afisarea ultimei coloane a matricei: ');
disp(y);

%generarea unei matrice cu valori aleatoare
%din distributia uniforma!! -> orice element are aceeasi sansa sa fie ales
%cu m linii si n coloane
m_aleator = unifrnd(0, 1, m, n);
% x, y sunt capetele intervalului din care se face extragerea

disp('Matrice generata aleator uniform: ');
disp(m_aleator);



end

