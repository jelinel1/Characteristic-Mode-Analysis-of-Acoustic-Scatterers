%% calculateFarField computes far-field for given structure and current
% Calculates far-field.
%
%  INPUTS
%   mesh:      mesh struct created by AToM, struct [1 x 1]
%   frequency: value of frequency, double [1 x 1]
%
%  INPUTS
%  (parameters)
%   'basisFcns'  basis functions struct created by AToM, struct [1 x 1]
%   'iVec'       vector of expansion coeficients, double [N x 1]
%   'theta'      vector of points in theta spherical coordinate,
%                 double [1 x N], default: linspace(0, pi, 46)
%   'phi'        vector of points in phi spherical coordinate,
%                 double [1 x N], default: linspace(0, 2*pi, 91)
%   'J'          current density to be plotted, double [N x 3]
%   'Jx'         x component of current density to be plotted,
%                 double [N x 1]
%   'Jy'         y component of current density to be plotted,
%                 double [N x 1]
%   'Jz'         z component of current density to be plotted,
%                 double [N x 1]
%   'quadOrder'  quadrature order, double [1 x 1]]
%
%  OUTPUTS
%   farFieldStructure:   structure with all computed quantities,
%                         struct [1 x 1]
%
%  SYNTAX
%
%  farFieldStructure = results.calculateFarField(mesh, frequency, ...
%    'basisFcns', basisFcns);
%  farFieldStructure = results.calculateFarField(mesh, frequency, ...
%    'basisFcns', basisFcns, 'theta', linspace(0, pi, 46), ...
%    'phi', linspace(0, 2*pi, 91));
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Jan Eichler, CTU in Prague
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
