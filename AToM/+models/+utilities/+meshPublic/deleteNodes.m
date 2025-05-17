%% deleteNodes deletes nodes from given mesh
%  This function takes nodes a their connections
%  (planar triangulation and tetrahedral meshes),
%  which form a mesh in 3D space.
%  It outputs a new mesh without nodes specified in nodes.
%
%  INPUTS
%   nodes: point coordinates, double [N x 3]
%   connectivityList: connectivity of nodes, double [N x (3, 4)]
%   nodes: points to delete from the mesh, double [N x 1]
%
%  OUTPUTS
%   newNodes: new set of points, double [N x 3]
%   newConnectivityList: new set of connections, double [N x 3]
%
%  SYNTAX
%
%  [newNodes, newConnectivityList] =
%  models.utilities.meshPublic.deleteNodes(nodes, connectivityList, nodesToDelete);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU, martin.strambach@antennatoolbox.com
% mcode docu
