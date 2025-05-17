%% translateMesh rotates given set of points by given angles
%  This function takes nodes in 3D and translates them by given
%  vector specified in variable shift.
%
%  INPUTS
%   nodes: node coordinates, double [N x 3]
%   shift: vector for translation, double [1 x 3]
%
%  OUTPUTS
%   newNodes: nodes translated by shift, double [N x 3]
%
%  SYNTAX
%
%  [newNodes] = models.utilities.meshPublic.translateMesh(nodes, shift);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
