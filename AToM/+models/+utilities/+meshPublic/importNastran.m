%% importNastran Imports mesh from NASTRAN file
%
%  INPUTS
%   fileName: name of imported file
%
%  OUTPUTS
%   nodes: coordinates of points, double [N x 3]
%   edges: pointers on nodes which represents edges of mesh, double [N x 2]
%   connectivityList: pointers on nodes which represents
%   connectivityList of mesh, double [N x 3]
%   tetrahedrons: not used, double [N x 4]
%   fileIsReadable: informs whether file can be read, logical [1 x 1]
%
%  SYNTAX
%
%  [nodes, edges, connectivityList, tetrahedrons, fileIsReadable] =
%  models.utilities.meshPublic.importNastran(filePath);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Martin Marek, BUT, martin.marek@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
% mcode docu
