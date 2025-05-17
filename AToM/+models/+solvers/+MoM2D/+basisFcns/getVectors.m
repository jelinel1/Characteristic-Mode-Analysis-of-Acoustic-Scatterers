%% getVectors evaluates quadrature points positions and rho vectors for RWG fcns
% The function obtains selected component (x/y/z) of Cartesian coordinates
% for points described on given elements using barycentric coordinate system.
%
%  INPUTS
%   nodes: list of nodes, double [nNodes x nDims]
%   triangleNodes: list of triangle node IDs, double [nTriangles x 3]
%   quadPoints: barycentric coordinates of quadrature points,
%               double [nPoints x 3]
%   triangles: selection of triangles,
%                double [2 x nSelectedTriangles]
%   outerNodes: outer node IDs for triangles, double [2 x nSelectedTriangles]
%
%  OUTPUTS
%   quadPosPM: Cartesian components for all quadrature points in +/- triangles,
%             double [(nPoints x nSelectedTriangles x 2) x 3]
%
%   rhoPM: Cartesian components of vector rho for all quadrature points
%          in +/- triangles, double [(nPoints x nSelectedTriangles x 2) x 3]
%
%  SYNTAX
%
%  [radiusVectors, basisVectors] = getVectors(nodes, triangleNodes, ...
%                                  quadPoints, triangles, outerNodes)
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
