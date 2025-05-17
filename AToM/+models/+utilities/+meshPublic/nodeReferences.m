%% nodeReferences counts references of nodes in connectivityList
%
%  INPUTS
%   nodes: double, [N x 3]
%   connectivityList: double [N x (2, 3, 4)]
%
%  OUTPUTS
%   countedReferences: number represents how many times is each node
%   referenced in connectivityList, double [N x 1]
%   isReferenced: is node referenced in connectivityList, double [N x 1]
%   referencedShift: shift of values in connectivityList if you
%   take only nodes(isReferenced,:), double [N x 1]
%
%  SYNTAX
%
%  [countedReferences, isReferenced, referencedShift] =
%  models.utilities.meshPublic.nodeReferences(nodes, connectivityList);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
