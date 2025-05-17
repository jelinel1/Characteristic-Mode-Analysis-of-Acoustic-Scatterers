%% plotRCS generates plot of monostatic/bistatic radar cross section
% Creates plot of RCS.
%
%  INPUTS
%  (parameters)
%   'mesh'                mesh struct created by AToM, struct [1 x 1]
%   'basisFcns'           basis functions struct created by AToM,
%                          struct [1 x 1]
%   'iVec'                vector of expansion coeficients, double [N x 1]
%   'theta'               vector of points in theta spherical coordinate,
%                          double [1 x N]
%   'phi'                 vector of points in phi spherical coordinate,
%                          double [1 x N]
%   'frequency'           value of frequency, double [1 x N]
%   'component'           specify componenit of used radiation intesity,
%                          char [1 x N],
%                          {'theta', 'phi', 'total'}, default: 'total'
%   'RCS'                 data for given theta and phi, double [L x M x N]
%                          L - number of points in theta
%                          M - number of points in phi
%                          N - number of frequencies
%   'independentVariable' variable on x axis, char [1 x N]
%                          {'theta', 'phi', 'frequency'}, default: 'theta'
%   'fixedDimensionTheta' value of fixed dimension theta, double [1 x 1]
%   'fixedDimensionPhi'   value of fixed dimension theta, double [1 x 1]
%   'options'             ploting options, list below, struct [1 x 1]
%   'handles'             handles to the modification, struct [1 x 1]
%   'template'            template containing graphic rules, struct [1 x 1]
%
%  OUTPUTS
%   handles:   structure with all graphic objects, struct [1 x 1]
%
%  SYNTAX
%
%  results.plotRCS('RCS', RCS, 'theta', theta, 'phi', phi, ...
%    'independentVariable', 'theta', 'fixedDimensionPhi', pi);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
