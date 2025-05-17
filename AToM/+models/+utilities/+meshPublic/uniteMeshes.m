%% uniteMeshes creates one mesh from 2 sets of nodes and connectivity lists
%  This function connects two meshes into one connectivity list and one unique
%  set of nodes.
%
%  INPUTS
%   nodes1: node coordinates 1, double [N x X]
%   connectivityList1: nodes1 connectivity, double [N x X]
%   nodes2: node coordinates 2, double [N x X]
%   connectivityList2: nodes2 connectivity, double [N x X]
%
%  OUTPUTS
%   newNodes: unique set of nodes, double [N x X]
%   newConnectivityList: new connectivity List, double [N x X]
%
%  SYNTAX
%
%  [newNodes, newConnectivityList] = models.utilities.meshPublic.
%     uniteMeshes(nodes1, connectivityList1, nodes2, connectivityList2);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
