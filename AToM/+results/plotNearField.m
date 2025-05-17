%% plotNearField generates plot of near-field
% Creates plot of near-field.
%
%  INPUTS
%  (parameters)
%   'mesh'          mesh struct created by AToM, struct [1 x 1]
%   'basisFcns'     basis functions struct created by AToM, struct [1 x 1]
%   'iVec'          vector of expansion coeficients, double [N x 1]
%   'frequency'     value of frequency, double [1 x 1]
%   'uPoints'       vector of points in first dimension, double [1 x N]
%   'vPoints'       vector of points in secont dimension, double [1 x M]
%   'plane'         near field plane, {'x', 'y', 'z'}
%   'distance'      perpendicular distance from origin, double [1 x 1]
%   'nearField'     data for given uPoints and vPoints, double [N x M]
%   'options'       ploting options, list below, struct [1 x 1]
%   'handles'       handles to the modification, struct [1 x 1]
%   'template'      template containing graphic rules, struct [1 x 1]
%   'userFunction'  function handle used to choose what to plot,
%                    function handle [1 x 1], default function @(nf) nf.E
%
%   +-----------+---------+-----------+-----------+
%   |  'plane'  |  plane  |  uPoints  |  vPoints  |
%   +===========+=========+===========+===========+
%   |    'x'    |  (y,z)  |     y     |     z     |
%   |    'y'    |  (x,z)  |     x     |     z     |
%   |    'z'    |  (x,y)  |     x     |     y     |
%   +-----------+---------+-----------+-----------+
%
%   Options structure, logical [1 x 1] in each field
%    options.showNearField    generate surface of near-field
%
%  OUTPUTS
%   handles:   structure with all graphic objects, struct [1 x 1]
%
%  SYNTAX
%
%  handles = results.plotNearField('nearField', nearField, ...
%    'uPoints', uPoints,  'vPoints', vPoints, 'plane', 'x', ...
%    'distance', distance);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
