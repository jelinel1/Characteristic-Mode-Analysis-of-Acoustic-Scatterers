%% gaussQuadEdge returns Gauss quadrature points and weights for an edge
% This function provides points and weights for the Gaussian quadrature
% of order _nQuad_ for edges.
%
%  INPUTS
%   nQuad: the order of the Gaussian quadrature (n <= 12)
%
%  OUTPUTS
%   points: barycentric coordinates of points, double [N x 2]
%   weights: quadrature weights
