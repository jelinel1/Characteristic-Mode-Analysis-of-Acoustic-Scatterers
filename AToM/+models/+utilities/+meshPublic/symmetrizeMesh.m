%% symmetrizeMesh
%
%  INPUTS
%   nodes: mesh nodes, double [M x 3]
%   connectivityList: nodes connectivity, double [N x (2, 3, 4)]
%   plane: symmetry plane, double [3 x 3]
%
%  OUTPUTS
%   newNodes: mesh nodes, double [M x 3]
%   newConnectivityList: nodes connectivity, double [N x (2, 3, 4)]
%   mirroredElements: [N x 1]
%
%  SYNTAX
%
%  [newNodes, newConnectivityList, mirroredElements] = models.utilities
%     .meshPublic.symmetrizeMesh(nodes, connectivityList, plane);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
