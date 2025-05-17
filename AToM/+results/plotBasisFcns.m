%% plotBasisFcns generates plot of given basis functions
% Creates plot of basis functions.
%
%  INPUTS
%   mesh:      mesh struct created by AToM, struct [1 x 1]
%   basisFcns: basis functions struct created by AToM, struct [1 x 1]
%
%  INPUTS
%  (parameters)
%   'options'     ploting options, list below, struct [1 x 1]
%   'handles'     handles to the modification, struct [1 x 1]
%   'template'    template containing graphic rules, struct [1 x 1]
%
%  Options structure, logical [1 x 1] in each field
%   options.showBasisFcns         generate basis functions
%   options.showBasisFcnsNumbers  generate numbers of basis functions
%
%  OUTPUTS
%   handles:   structure with all graphic objects, struct [1 x 1]
%
%  SYNTAX
%
%  handles = results.plotBasisFcns(mesh, basisFcns)
%  handles = results.plotBasisFcns(mesh, basisFcns, 'options', options)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
