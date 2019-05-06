function [q] =FPS( Populatia, nr_de_indivizi)
    
    n = 6; %am doar 6 tipuri de bancnote
    q = zeros(1,nr_de_indivizi);
    
    fitnesst =sum(Populatia(:, n+1));
    p = Populatia(:, n+1) / fitnesst;
    q(1) = p(1);
    for i=2:nr_de_indivizi
        q(i) = q(i-1) + p(i);
    end
end
