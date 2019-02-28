function []=plot_obiectiv(V,timp,a,b)

figure %functia pentru deschiderea ferestrei de afisare
[X,Y] = meshgrid(a:0.01:b); %meshgrid genereaza coordonatele 2D pt X, Y cu intervalul a,b si scala 0.01
Z = exp(-X.^2-Y.^2)+Y.*cos(5*X)-X.*sin(3*Y); %Z va fi functia obiectiv

plot3(X,Y,Z,'m'); %functia de afisare a unui grafic 3D pe baza X,Y, si Z cu culoarea magenta
grid on %pastreaza in  fereastra de afisare grid-ul graficului 
hold on %pastreaza afisat graficul 3D curent la care vom mai adauga elemente
[dim, ~]=size(V); %determin numarul de puncte de maxim local in dim
for i=1:dim %pentru fiecare punct de maxim
    x=V(i,1); %extrag componentele de x,y si fitness in variabile
    y=V(i,2);
    z=f_obiectiv(x,y);
    if(i==timp) %la momentul atingerii pozitiei timp din vectorul de optime
        %il afisez diferit pentru ca e maximul global
        plot3(x,y,z,'ks','LineWidth',2,... %latimea liniei 2; ks = black square
                       'MarkerEdgeColor','k',... %muchia cu negru
                       'MarkerFaceColor','g',... %centrul cu verde
                       'MarkerSize',10); %dimensiunea mare
        hold on %pastreaza afisat
    else %daca nu e maximul global
        plot3(x,y,z,'ks'); %il afisez oricum cu alte caractersitici
        hold on
    end;
end;
end
