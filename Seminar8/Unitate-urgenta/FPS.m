function [q] = FPS(Pop,dim)
q = zeros(1,dim);
fitnesst = sum(Pop(:,3));
p = Pop(:,3) / fitnesst;
q(1) = p(1);
for i = 2 : dim
    q(i) = q(i-1) + p(i);
end
end

