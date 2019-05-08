function [Pop] = gen_pop(dim,fr,n)
Pop = zeros(dim,3);
for i = 1 : dim
    Pop(i,1:2) = unidrnd(10,1,2);
    Pop(i,3) = fitness(Pop(i,1:2),fr,n);
end
end
