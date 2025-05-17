%% mirrorMesh
%  Mirrors mesh according to a mirror plane given by its normal.
%
%  INPUTS
%   nodes: mesh nodes, double [N x 3]
%   normal: mirror plane normal, double [1 x 3]
%   origin: mirror plane origin, double [1 x 3]
%
%  OUTPUTS
%   newNodes: mesh nodes, double [N x 3]
%
%  SYNTAX
%
%  [newNodes] = models.utilities.meshPublic.mirrorMesh(nodes, normal, origin);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
