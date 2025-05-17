%% CART2BARY Transforms local cartesian coordinates into cartesian coordinates
%
%  INPUTS
%   p: matrix of points in Cartesian coordinates, double [N x 3]
%   p1: triangle vertex, double [1 x N]
%   p2: triangle vertex, double [1 x N]
%   p3: triangle vertex, double [1 x N]
%
%  OUTPUTS
%   alpha: first barycentric coordinate, double [N x 1]
%   beta: second barycentric coordinate, double [N x 1]
%
%  SYNTAX
%   [alpha, beta] = cart2bary(p, p1, p2, p3);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode
