function [ OK ] = este_fezabil( individ, matrice_cost_pachete)
    
    %stochez in matrice_cost_pachete cat ma costa(in grame) din fiecare
    %fruct pentru fiecare pachet
    
    smochine_total = 0;
    ananas_total = 0;
    curmale_total = 0;
    merisor_total = 0;
    
    for i = 1:5
        smochine_total = smochine_total + individ(i) * matrice_cost_pachete(i, 1);
        ananas_total = ananas_total + individ(i) * matrice_cost_pachete(i, 2);
        curmale_total = curmale_total + individ(i) * matrice_cost_pachete(i, 3);
        merisor_total = merisor_total + individ(i) *matrice_cost_pachete(i, 4);
    end;
    
    OK = true;
    
    if smochine_total > 100000 || ananas_total > 80000 || curmale_total > 120000 || merisor_total > 50000
        OK = false;
    end;
end

