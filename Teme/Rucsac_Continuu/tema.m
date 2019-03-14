function [] = tema(dim, cmax)
v_cost = load('cost.txt');
v_val = load('val.txt');
n = length(v_cost);

disp('Populatia generata este: ');
Pop_init = gen_pop(dim, v_cost, v_val, n, cmax);
disp(Pop_init);


disp('Functia fitness pentru fiecare individ:');
fitness = Pop_init(:, n + 1);
disp(fitness);

[fit_max, poz] = max(fitness);

disp('Calitatea maxima este: ');
disp(fit_max);

disp('Apartinde individului cu indexul: ');
disp(poz);

end

