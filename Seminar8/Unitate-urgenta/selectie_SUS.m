function [Parinti] = selectie_SUS(Populatie,dim)
q = FPS(Populatie,dim);
Parinti = zeros(dim,3);
i = 1;
r = unifrnd(0,1/dim);
j = 1;
while i <= dim
    while r < q(j)
        Parinti(i,:) = Populatie(j,:);
        i = i + 1;
        r = r + 1 / dim;
    end
    j = j + 1;
end
end

