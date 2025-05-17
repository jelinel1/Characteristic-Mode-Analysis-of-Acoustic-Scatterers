%% getInnerEdges returns edges in triangulation
%  This function returns set of inner edges which are specified by
%  connectivityList on nodes.
%
%  INPUTS
%   nodes: point coordinates, double [N x 3]
%   connectivityList: triangle vertices, double [N x 3]
%
%  OUTPUTS
%   innerNodes: set of inner nodes in triangulation, double [N x 2]
%
%  SYNTAX
%
%  [innerNodes] = models.utilities.meshPublic.getInnerNodes(nodes,
%  connectivityList);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
