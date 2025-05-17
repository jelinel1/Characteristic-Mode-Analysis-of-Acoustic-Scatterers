%% plotCharge generates plot of charge density on given structure
% Creates plot of charge density.
%
%  INPUTS
%   mesh:      mesh struct created by AToM, struct [1 x 1]
%
%  INPUTS
%  (parameters)
%   'basisFcns'   basis functions struct created by AToM, struct [1 x 1]
%   'iVec'        vector of expansion coeficients, double [N x 1]
%   'divJ'        vector of charge computed in triangle centroid,
%                  double [N x 1]
%   'divJnodes'   vector of charge computed in mesh nodes, double [N x 1]
%   'part'        part of plotted current, {'re', 'im', 'abs'}
%   'options'     ploting options, list below, struct [1 x 1]
%   'handles'     handles to the modification, struct [1 x 1]
%   'template'    template containing graphic rules, struct [1 x 1]
%
%  Options structure, logical [1 x 1] in each field
%   options.showCharge             generate triangles with color map
%                                 according to calculated charge density
%   options.colorbar               show colorbar
%
%  OUTPUTS
%   handles:   structure with all graphic objects, struct [1 x 1]
%
%  SYNTAX
%
%  handles = results.plotCharge(mesh, basisFcns, iVec)
%  handles = results.plotCharge(mesh, basisFcns, iVec)
%  handles = results.plotCharge(mesh, basisFcns, iVec, 'part', 'abs')
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
