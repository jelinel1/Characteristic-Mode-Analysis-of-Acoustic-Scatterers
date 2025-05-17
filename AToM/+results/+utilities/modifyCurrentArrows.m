%% modifyCurrentArrows function that allows plot user defined set of arrows
%
% INPUTS
%  mesh:      mesh struct created by AToM, struct [1 x 1]
%  points:    set of start points of the arrows, double [N x 3]
%  J:         current density to be plotted, double [N x 3]
%  handles:   structure of graphical objects obtained by plotCurrent
%              function, struct [1 x 1]
%
% INPUTS
% (parameters)
%  'arrowLength' sets maximal absolute length of arrow, double [1 x 1]
%  'arrowScale'  sets the scale of the arrows,
%                  {'uniform', 'proportional'}
%  'template'    template containing graphic rules, struct [1 x 1]
%
% OUTPUTS
%  handles:   structure with all graphic objects, struct [1 x 1]
%
% SYNTAX
%  handles = modifyCurrentArrows(mesh, points, J, handles)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode
