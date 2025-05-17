%% calculateRCS computes monostatic/bistatic radar cross section
% Calculates RCS.
%
%  INPUTS
%   mesh:      mesh struct created by AToM, struct [1 x 1]
%   basisFcns: basis functions struct created by AToM, struct [1 x 1]
%   iVec:      vector of expansion coeficients from AToM MoM,
%               double [N x 1]
%   frequency: value of frequency, double [1 x 1]
%
%  INPUTS
%  (parameters)
%   'theta'     vector of points in theta spherical coordinate,
%                double [1 x N], default: linspace(0, pi, 46)
%   'phi'       vector of points in phi spherical coordinate,
%                double [1 x M], default: linspace(0, 2*pi, 91)
%   'component' specify componenit of used radiation intesity,
%                char [1 x N], {'theta', 'phi', 'total'}, default: 'total'
%
%  OUTPUTS
%   RCS:   radar cross section (RCS), double [N x M]
%           N - number of points in theta
%           M - number of points in phi
%   theta: vector of points in theta spherical coordinate, double [1 x N]
%   phi:   vector of points in phi spherical coordinate, double [1 x M]
%
%  SYNTAX
%
%  [RCS, theta, phi] = calculateRCS(mesh, basisFcns, iVec, frequency);
%  [RCS, theta, phi] = calculateRCS(mesh, basisFcns, iVec, frequency, ...
%    'component', 'theta');
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
