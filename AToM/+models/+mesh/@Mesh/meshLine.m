%% meshLine creates mesh from a Line
% This function creates mesh from a line.
%
%  INPUTS
%   points: points on line, double [2 x 3]
%   fh: handle of density function, char [1 x 1]
%   h0: maximal length of each element, double [1 x 1]
%   parameter: interval for parameter, double [1 x 2]
%   fixPoints: fix points, double [N x 3]
%   maxElem: maximum element size, double [1 x 1]
%
%  OUTPUTS
%   nodes: coordinates of points, double [N x 3]
%   elements: pointers on nodes which represents lines of mesh, int [N x 2]
%
%  SYNTAX
%
%   [nodes, elements] = meshEllipseArc(points, fh, h0, parameter, fixPoints, maxElem)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Vit Losenicky, CTU, vit.losenicky@antennatoolbox.com
% (c) 2015, Ondrej Kratky, CTU, ondrej.kratky@antennatoolbox.com
