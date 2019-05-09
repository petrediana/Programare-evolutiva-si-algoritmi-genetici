function [popSupravietuitori] = generatia_urmatoare(popMutanta, dim, n)
popMutanta_sortata=sortrows(popMutanta, 2*n-1);
popSupravietuitori=popMutanta_sortata(1:dim, :);
end

