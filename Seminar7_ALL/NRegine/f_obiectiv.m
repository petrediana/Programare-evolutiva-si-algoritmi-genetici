function [val]=f_obiectiv(p,n)
% functia obiectiv din problema celor n regine
% gradul de "neconformitate" a unei permutari:numarul de pozitii distincte de pe tabla de sah
% pentru care reginele plasate in acele pozitii sunt in situatie de atac
val=0;
for i=1:n
    for j=i+1:n
        if(abs(i-j)==abs(p(i)-p(j))) %daca sunt elemente conseccutive in permutare <=> reginele de pe pozitiile respective se pot ataca
            val=val+1; %=> crescte val care va duce in final la scaderea functiei obiectiv (care trebuie maximizata)
        end
    end
end
% calitatea permutarii: numarul total de perechi de pozitii (regine) posibile - numarul de perechi "neconforme" 
val=n*(n-1)/2-val; %n(n+1) este numarul de perechi de regine (exemplu n = 4 => perechile de verificat 1-2, 1-3, 1-4, 2-3, 2-4, 3-4) adica 6  perechi (4 * 3 / 2), corectez valoarea (o scad) cu cat sunt mai multe regine in poz de atac
end
