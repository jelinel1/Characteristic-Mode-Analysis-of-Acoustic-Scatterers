function f = gaussQuadRWGFunc(x1,y1,z1,x2,y2,z2,o1x,o1y,o1z,o2x,o2y,o2z,Par)
%% gaussQuadFunc
% Function used in example qaussQuadRWG
%
% Included in AToM. /info@antennatoolbox.com/
% (c) 2015, Vit Losenicky, CTU in Prague,  /vit.losenicky@antennatoolbox.com/

f = x1 + y1 + z1 + x2 + y2 + z2 + o1x + o1y + o1z + o2x + o2y + o2z + Par;
end