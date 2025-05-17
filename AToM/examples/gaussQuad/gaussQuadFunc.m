function f = gaussQuadFunc(x1,y1,z1,x2,y2,z2,Par)
%% gaussQuadFunc
% Function used in example qauss_quad
%
% Included in AToM. /info@antennatoolbox.com/
% (c) 2015, Vit Losenicky, CTU in Prague,  /vit.losenicky@antennatoolbox.com/

f = 1./((x1-x2).^2 + (y1-y2).^2 + (z1-z2).^2+Par);
end