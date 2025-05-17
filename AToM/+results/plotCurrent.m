%% plotCurrent Generates plot of current density on given structure
% Creates plot of current density.
%
%  INPUTS
%   mesh:      mesh struct created by AToM, struct [1 x 1]
%
%  INPUTS
%  (parameters)
%   'basisFcns'   basis functions struct created by AToM, struct [1 x 1]
%   'iVec'        vector of expansion coeficients, double [N x 1]
%   'J'           current density to be plotted, double [N x 3]
%   'Jnodes'      current density to be plotted computed in mesh nodes,
%                  double [N x 3], important for interpolated colors
%   'Jx'          x component of current density to be plotted,
%                  double [N x 1]
%   'Jy'          y component of current density to be plotted,
%                  double [N x 1]
%   'Jz'          z component of current density to be plotted,
%                  double [N x 1]
%   'part'        part of plotted current, {'re', 'im', 'abs'}
%   'scale'       sets the scale of the color map,
%                  {'linear', 'normalized','logarithmic'}
%   'arrowScale'  sets the scale of the arrows,
%                  {'uniform', 'proportional'}
%   'arrowLength' sets maximal absolute length of arrow, double [1 x 1]
%   'options'     ploting options, list below, struct [1 x 1]
%   'handles'     handles to the modification, struct [1 x 1]
%   'template'    template containing graphic rules, struct [1 x 1]
%
%  Options structure, logical [1 x 1] in each field
%   options.showCurrentIntensity   generate triangles with color map
%                                 accordingto calculated current density
%   options.showCurrentArrows      generate arrows according to current
%                                 density
%   options.colorbar               show colorbar
%
%  OUTPUTS
%   handles:   structure with all graphic objects, struct [1 x 1]
%
%  SYNTAX
%
%  results.plotCurrent(mesh, 'basisFcns', basisFcns, 'iVec', iVec)
%  handles = results.plotCurrent(mesh, 'basisFcns', basisFcns, 'iVec', ...
%   iVec)
%  handles = results.plotCurrent(mesh,  'basisFcns', basisFcns, ...
%   'iVec', iVec, 'part', 'abs', 'scale', 'linear')
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
