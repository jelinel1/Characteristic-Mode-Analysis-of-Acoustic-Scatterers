%% calculateCurrent calculate current density on given structure
% Calculates current density from given results comming from MOM.
%
%  INPUTS
%   mesh:      mesh struct created by AToM, struct [1 x 1]
%   basisFcns: basis functions struct created by AToM, struct [1 x 1]
%   iVec:      vector of expansion coeficients from AToM MoM,
%               double [N x 1]
%
%  INPUTS
%   (optional)
%   points:   Cartesian coordinates of the points, double [N x 3]
%
%  OUTPUTS
%   Jx:       x component of the current density, double [N x 1]
%   Jy:       y component of the current density, double [N x 1]
%   Jz:       z component of the current density, double [N x 1]
%   points:   Cartesian coordinates of the points, double [N x 1]
%
%  SYNTAX
%
%  [Jx, Jy, Jz] = results.calculateCurrent(mesh, basisFcns, iVec)
%  [Jx, Jy, Jz, points] = results.calculateCurrent(mesh, basisFcns, ...
%                         iVec, points)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
