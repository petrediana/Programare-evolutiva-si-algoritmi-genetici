function [Pop_urm] = Genitor(Pop_curenta,Copii,dim,m,ni)
%populatia curenta este sortata crescator dupa valorile ultimei coloane
%(dupa fitness)
Pop = sortrows(Pop_curenta,m); %le sorteaza crescator (cei mai slabi indivizi sunt primii)
%sunt inlocuiti cei mai slabi ni indivizi din Pop_curenta cu ni copii -
%copiii care inlocuiesc parintii sunt generati aleator, un copil putand fi
%considerat o singura data
Pop_urm = Pop;
poz = [ ];
for i=1:ni
    gata=0;
    while(~gata)
        t = unidrnd(dim); %generez aleator o pozitie
        if(~ismember(t,poz)) %daca pozitia nu e deja generata (nu e deja selectat anterior copilul)
            gata = 1; %va iesi din while
            poz = [poz; t]; %salvez pozitia copilului
        end
    end
    Pop_urm(i,:)=Copii(t,:); %incepand de la prima pozitie (adica de la cel mai slab individ din populatia initiala)
    % se inlocuieste indivisul cu copilul de pe pozitia generata aleator
end
end