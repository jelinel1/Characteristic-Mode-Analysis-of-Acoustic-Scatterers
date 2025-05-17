%% deleteConnectivityElement deletes triangles or tetrahedrons from a given mesh
%  This function takes nodes a their connections
%  (planar triangulation and tetrahedral meshes),
%  which form a mesh in 3D space.
%  It outputs new mesh without given connectivity list elements.
%
%  INPUTS
%   nodes: node coordinates, double [N x 3]
%   connectivityList: mesh connectivity, double [N x (3, 4)]
%   elementsToDelete: connectivity elements to delete from the mesh, double [N x 1]
%
%  OUTPUTS
%   newNodes: new set of nodes, double [N x 3]
%   newConnectivityList: new set of connections, double [N x 3]
%
%  SYNTAX
%
%  [newNodes, newConnectivityList] =
%  models.utilities.meshPublic.elementsToDelete(nodes, connectivityList,
%  elementsToDelete);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU, martin.strambach@antennatoolbox.com
% mcode docu
