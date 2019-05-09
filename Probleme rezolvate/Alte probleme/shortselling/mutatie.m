function [popMutanta] = mutatie(O, tau, taup, eps, dim, n, Q,rmed,alpha,B,ro,Rp)
popMutanta=O;
for i=1:dim
    cromozom=O(i, 1:2*n-2);
    x=cromozom(1:n-1);
    sigma=cromozom(n:2*n-2);
    [x1, y1]=mutatie_necorelata(x, n, sigma, taup, tau, eps);
    cromozomr=[x1 y1];
    popMutanta(i, 1:2*n-2)=cromozomr;
    popMutanta(i, 2*n-1)=functie_obiectiv(Q,rmed,alpha,B,ro,Rp,x');
end
end

