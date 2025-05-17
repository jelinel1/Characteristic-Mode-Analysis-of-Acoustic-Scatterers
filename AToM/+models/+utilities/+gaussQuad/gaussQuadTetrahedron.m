%% gaussQuadTetrahedron returns Gauss quadrature points and weights for a tetrahedrons
% The function gives the quadrature points as a [3, n] matrix and
% the weights as an [n,1] matrix for integration over the unit
% tetrahedra whose nodes are (0,0,0), (1,0,0), (0,1,0) and (0,0,1).
%
% The input argument p indicates the maximal degree of the polynomials
% of two variables which will be integrated exactly (p<15). By a linear
% transformation, X and W were obtained from the paper:
%
% Lin-bo Zhang, Tao Cui and Hui Liu,
% A set of symmetric quadrature rules on triangles and tetrahedra,
% J. Comp. Math., 26(3), 2008.
%
%  INPUTS
%   nQuad: the order of the Gaussian quadrature
%
%  OUTPUTS
%   points: barycentric coordinates of points, double [N x 3]
%   weights: quadrature weights, double [N x 1]
%
%  SYNTAX
%
%  gaussQuadTetrahedron(nQuad)
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2020, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode
