%% BARY2CART Transforms local simplex coordinates into cartesian coordinates
%
%  INPUTS
%   alpha: first barycentric coordinate, double [N x 1]
%   beta: second barycentric coordinate, double [N x 1]
%   p1: triangle vertex, double [3 x 1]
%   p2: triangle vertex, double [3 x 1]
%   p3: triangle vertex, double [3 x 1]
%
%  OUTPUTS
%   pMat: matrix of points in Cartesian coordinates, double [3 x N]
%
%  SYNTAX
%   pMat = bary2cart(alpha, beta, p1, p2, p3);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode
