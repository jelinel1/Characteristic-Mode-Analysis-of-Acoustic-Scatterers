%% importMphtxt Imports mesh from mphtxt file
%
%  INPUTS
%   fileName: name of imported file, char [1 x N]
%
%  OUTPUTS
%   nodes: coordinates of points, double [N x 3]
%   connectivityList: pointers on nodes which represents
%   triangles of mesh, double [N x 3]
%   fileIsReadable: informs whether file can be read, logical [1 x 1]
%
%  SYNTAX
%
%  [nodes, connectivityList, fileIsReadable] =
%  models.utilities.meshPublic.importMphtxt(fileName);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
