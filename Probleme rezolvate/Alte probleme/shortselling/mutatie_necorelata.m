function [x1, sigma1] = mutatie_necorelata(x, n, sigma, taup, tau, eps)
% rtau - variabila r generata  
rtau=normrnd(0, tau);
rtaup=normrnd(0, taup, 1, n-1);
sigma1=zeros(1, n-1);
x1=zeros(1, n-1);
%calculam si modificam sigmele

for i=1:n-1
    sigma1(i)=sigma(i)*exp(rtau+rtaup(i));
    if sigma1(i)<eps
        sgma1(i)=eps;
    end
end
for i=1:n-1
    x1(i)=x(i)+normrnd(0, sigma1(i));
end
end

