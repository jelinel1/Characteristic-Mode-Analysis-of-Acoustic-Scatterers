%% calculateNearField computes near-field for given structure and current
% Calculates near-field.
%
%  INPUTS
%   mesh:      mesh struct created by AToM, struct [1 x 1]
%   basisFcns: basis functions struct created by AToM, struct [1 x 1]
%   iVec:      vector of expansion coeficients, double [N x 1]
%   frequency: value of frequency, double [1 x 1]
%   uPoints:   vector of points in first dimension, double [1 x N]
%   vPoints:   vector of points in secont dimension, double [1 x M]
%   plane:     near field plane, {'x', 'y', 'z'}
%   distance:  perpendicular distance from origin, double [1 x 1]
%
%   +-----------+---------+-----------+-----------+
%   |  'plane'  |  plane  |  uPoints  |  vPoints  |
%   +===========+=========+===========+===========+
%   |    'x'    |  (y,z)  |     y     |     z     |
%   |    'y'    |  (x,z)  |     x     |     z     |
%   |    'z'    |  (x,y)  |     x     |     y     |
%   +-----------+---------+-----------+-----------+
%
%  OUTPUTS
%   nearFieldStructure:   structure with all computed quantities,
%                          struct [1 x 1]
%
%  SYNTAX
%
%  nearFieldStructure = results.calculateNearField(mesh, basisFcns, ...
%     iVec, frequency, uPoints, vPoints, plane, distance)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Jan Eichler, CTU in Prague
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
