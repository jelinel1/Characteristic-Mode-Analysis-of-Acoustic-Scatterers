%% getBoundary3D returns outer edges of of connected triangles/tetrahedrons in 3D
%  This function returns set of boundary edges which are specified by
%  triangulation given by connectivityList and nodes.
%
%  INPUTS
%   nodes: point coordinates, double [N x 3]
%   connectivityList: triangle/tetrahedra connectivity, double [N x 3]
%
%  OUTPUTS
%   edges: set of boundary edges in the mesh, double [N x 2]
%   boundaryNodes: set of boundary nodes in the mesh, double [N x 3]
%
%  SYNTAX
%
%  [edges, newNodes] = models.utilities.meshPublic.getBoundary3D(nodes, connectivityList);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
