function [ y ] = mutatie_fluaj( x , sigma )
% y este gena actualizata (mutanta)
% x este gena pe care o mutam
%sigma este deviatia standard pt distributia normala

%determinarea valorii cu care modific gena curenta
r = normrnd(0, sigma);

%actualizarea valorii genei
y = x + r;

if y < 0
    y = 0;
else
    if y > 1
        y = 1;
    end
end


end
