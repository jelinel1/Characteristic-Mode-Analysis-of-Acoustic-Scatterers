%% getBoundary2D returns outer edges of planar triangulation
%  This function returns set of boundary edges which are specified by
%  triangulation connectivityList and nodes.
%
%  INPUTS
%   nodes: point coordinates, double [N x 3]
%   connectivityList: triangle vertices, double [N x 3]
%
%  OUTPUTS
%   edges: set of boundary edges in the triangulation, double [N x 2]
%   boundaryNodes: set of boundary nodes in the triangulation, double [N x 3]
%
%  SYNTAX
%
%  [edges, boundaryNodes] = models.utilities.meshPublic.getBoundary2D(nodes,
%  connectivityList);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
