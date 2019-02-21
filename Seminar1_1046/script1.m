a = 12;

%initializare vector coloana
b = [1; 2; 3];

%initializare vector linie
d = [1, 2, 3];

%transpusul unui vector
b1 = b.';

disp('Vectorul transpus este: '); %functie cu care afisez continutul
disp(b1);

%declarare si initializarea unei matrice
c = [1 2 3 6 9 ; -4 2 1 4 -5; 2 3 2 1 0; -3 2 1 4 6];
disp('Matricea mea este: ');
disp(c);

%extragerea primei linii a matricei
x = c(1, :);

%extragerea celei de a doua coloane
y = c(:, 2);

%extragerea unei submatrice
z = c(1 : 3,  2 : 4);

%ii dau cu minus pasul, eu acum o iau invers
t = c(3 : -1 : 1, 2 : 4);


