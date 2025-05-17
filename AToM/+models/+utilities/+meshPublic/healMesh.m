%% healMesh removes duplicate nodes and triangles
%  HealMesh utility removes duplicate nodes a triangles from mesh.
%
%  INPUTS
%   nodes: point coordinates, double [N x 3]
%   connectivityList: connectivity of nodes, double [N x (2, 3, 4)]
%
%  OUTPUTS
%   newNodes: new set of nodes, double [N x 3]
%   newConnectivityList: new set of connections, double [N x (2, 3, 4)]
%
%  SYNTAX
%
%  [newNodes, newConnectivityList] =
%  models.utilities.meshPublic.healMesh(nodes, connectivityList);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
