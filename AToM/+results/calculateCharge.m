%% calculateCharge calculate charge density on given structure
% Calculates charge distribution.
%
%  INPUTS
%   mesh:      mesh struct created by AToM, struct [1 x 1]
%   basisFcns: basis functions struct created by AToM, struct [1 x 1]
%   iVec:      vector of expansion coeficients from AToM MoM,
%              double [N x 1]
%
%  INPUTS
%  (optional)
%   points:   Cartesian coordinates of the points, double [N x 3]
%
%  OUTPUTS
%   divJ:     divergence of the current density, double [N x 1]
%   points:   Cartesian coordinates of the points, double [N x 3]
%
%  SYNTAX
%
%  divJ = results.calculateCharge(mesh, basisFcns, iVec)
%  [divJ, points] = results.calculateCharge(mesh, basisFcns, iVec, points)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
