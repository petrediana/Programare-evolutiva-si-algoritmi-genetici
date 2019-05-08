function [Nx] = vecini1(x,n,eps,a,b)
%pentru hill climbing trebuie sa analizez vecinii din jurul punctului
%curent
Nx = []; %vectorul cu vecini ce va fi returnat
for i = 1 : n  %pentru fiecare element al solutiei
    y = x;  %salvez starea
    y(i) = x(i) + eps; %la starea initiala adaug aceeasi valoare la toate componentele
    if apartine(y,n,a,b) 
        Nx = [Nx; y]; %daca componentele lui y (adica vecinul lui x) 
        %se incadreaza in intervalul de referinta, el va fi trecut in
        %vectorul cu vecini.
    end
    
    y = x; %repet exact aceeasi procedura dar de data asta scad aceeasi valoare
    %din toate componentele punctului curent
    y(i) = x(i) - eps;
    if apartine(y,n,a,b) %verific conditia ca vecinii sa fie in interval
        Nx = [Nx; y]; %ii adaug la vectorul de vecini
    end
end
end

function ok = apartine(y,n,a,b) %verific ca solutia odata modificata sa se incadreze 
%in continuare in intervalul de referinta al valorilor
ok = 1; %tin flag-ul pe true
for i = 1 : n %parcurg fiecare componenta a solutiei
    if y(i) < a(i) || y(i) > b(i) %daca valoarea e mai mica ca a sau mai mare ca b 
        %adica depaseste inferior sau superior intrvalul,
        ok = 0; %flag pe false si opreste executia
        break;
    end
end
end