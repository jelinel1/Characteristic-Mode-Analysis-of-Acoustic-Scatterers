%% BARY2CART Transforms local simplex coordinates into cartesian coordinates
%
%  INPUTS:
%   alpha:     1st coordinate, double [n x 1]
%   beta:      2nd coordinate, double [n x 1]
%   gamma:     3rd coordinate, double [n x 1]
%   a:         1st vertex of tetrahedron, double [1 x 3]
%   b:         2nd vertex of tetrahedron, double [1 x 3]
%   c:         3rd vertex of tetrahedron, double [1 x 3]
%   d:         4th vertex of tetrahedron, double [1 x 3]
%
%  OUTPUTS:
%   p:         point(s) in Cartesian coordinates, double [n x 3]
%
%  SYNTAX
%   pMat = bary2cart(alpha, beta, gamma, a, b, c, d);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2020, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode
