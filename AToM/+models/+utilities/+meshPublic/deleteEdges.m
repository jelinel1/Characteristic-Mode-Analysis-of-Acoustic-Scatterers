%% deleteEdges deletes edges from given mesh
%  This function takes nodes a their connections
%  (planar triangulation and tetrahedral meshes),
%  which form a mesh in 3D space.
%  It outputs a new mesh without given edges.
%
%  INPUTS
%   nodes: point coordinates, double [N x 3]
%   connectivityList: connectivity of nodes, double [N x (3, 4)]
%   edgesToDelete: edges to delete from the mesh, double [N x 1]
%
%  OUTPUTS
%   newNodes: new set of nodes, double [N x 3]
%   newConnectivityList: new set of connections, double [N x 3]
%
%  SYNTAX
%
%  [newNodes, newConnectivityList] =
%  models.utilities.meshPublic.deleteEdges(nodes, connectivityList, edgesToDelete);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
