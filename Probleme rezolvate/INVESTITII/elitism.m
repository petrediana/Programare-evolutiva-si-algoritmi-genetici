function [Pop_urm] = elitism(PopIni,Copii,dim,n)
    m = n+1; %indicele coloanei cu valorile fitness
    Pop_urm = Copii;

    [val1, i1] = max(PopIni(:,m)); %cel mai bun fitness din PopIni + pozitia individului
    [val2, ~] = max(Copii(:,m)); %cel mai bun fitness din Copii
    if(val1 > val2) %daca cel mai bun individ din PopIni e mai bun decat cel mai bun copil
        best = PopIni(i1,:); %extrag cel mai bun individ din PopIni
        ind = unidrnd(dim); %aleg o pozitie aleatoare pt Copii
        Pop_urm(ind,:) = best; %copilul ales aleator este inlocuit cu cel mai bun individ din PopIni
    end
end
