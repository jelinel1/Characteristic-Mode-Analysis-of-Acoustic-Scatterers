%% importGeo imports mesh from GEO files
%
%  INPUTS
%   filePath: path to imported file, char [1 x N]
%
%  OUTPUTS
%   nodes: coordinates of points, double [N x 3]
%   connectivityList: subscripts into nodes, double [N x 3]
%   fileIsReadable: informs whether file can be read, logical [1 x 1]
%
%  SYNTAX
%
%  [nodes, connectivityList, fileIsReadable] =
%  models.utilities.meshPublic.importGeo(filePath);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
