function [] = scrie_rezultate(Solutie,numeO)
Coresp=[];
for i=1:26
    Coresp=[Coresp [char(int16(i)+int16('a')-1);char(int16(Solutie(i))+int16('a')-1)]];
end
dlmwrite(numeO,Coresp);
end

