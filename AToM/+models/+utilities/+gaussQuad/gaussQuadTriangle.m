%% gaussQuadTriangle returns Gauss quadrature points and weights for a triangle
% This function provides points and weights for the Gaussian quadrature
% of order _nQuad_ for standard triangles. See Dunavant, D. A. (1985),
% High degree efficient symmetrical Gaussian quadrature rules for the triangle.
% Int. J. Numer. Meth. Engng., vol. 21, pp. 1129-1148, 1985
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
%  gaussQuadTriangle(nQuad)
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
% mcode
