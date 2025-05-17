%% plotCurrentDecomposition generates plot of current decomposition
% Creates plot of current decomposition.
%
%  INPUTS
%  (parameters)
%   'decomposition'   decomposition matrix, double [N x M]
%                      N - number of used modes
%                      M - number of frequencies
%   'indexMatrix'     indexation matrix used to identify modes,
%                      double [5 x N]
%                      N - number of used modes
%   'frequency'       frequency list, double [M x 1]
%   'mesh'            mesh struct created by AToM, struct [1 x 1]
%   'basisFcns'       basis functions struct created by AToM, struct [1 x 1]
%   'iVec'            vector of expansion coeficients, double [N x 1]
%   'threshold'       threshold to filter modes, double [1 x 1]
%   'options'         ploting options, list below, struct [1 x 1]
%   'handles'         handles to the modification, struct [1 x 1]
%   'template'        template containing graphic rules, struct [1 x 1]
%
%  OUTPUTS
%   handles:   structure with all graphic objects, struct [1 x 1]
%
%  SYNTAX
%
%  handles = results.plotCurrentDecomposition('mesh', mesh, ...
%    'basisFcns', basisFcns, 'iVec', iVec, 'frequency', frequency)
%  handles = results.plotCurrentDecomposition( ...
%    'decomposition', decomposition, 'frequency', frequency)
%  handles = results.plotCurrentDecomposition( ...
%    'decomposition', decomposition, 'indexMatrix', indexMatrix, ...
%    'frequency', frequency)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
