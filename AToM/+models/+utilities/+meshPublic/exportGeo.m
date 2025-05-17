%% exportGeo exports mesh to GEO file
%
%  INPUTS
%   nodes: coordinates of points, double [N x 3]
%   triangles: pointers on nodes which represents triangles of mesh, double [N x 3]
%   filePath: path to output directory, char [1 x N]
%   fileName: name of the GEO file, char [1 x N]
%
%  SYNTAX
%
%  models.utilities.meshPublic.exportGeo(nodes, connectivityList, path, name);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
