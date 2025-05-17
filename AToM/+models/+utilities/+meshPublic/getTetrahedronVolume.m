%% getTetrahedronVolume returns volumes of all tetrahedrons
%
%  INPUTS
%   nodes: point coordinates, double [M x 3]
%   connectivityList: tetrahedrna connectivity, double [N x 4]
%
%  OUTPUTS
%   volume: volume of each tetrahedron [N x 1]
%
%  SYNTAX
%
%  [volume] = models.utilities.meshPublic.getTetrahedronVolume(nodes,
%  connectivityList);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2020, Martin Strambach, CTU, martin.strambach@antennatoolbox.com
% mcode docu
