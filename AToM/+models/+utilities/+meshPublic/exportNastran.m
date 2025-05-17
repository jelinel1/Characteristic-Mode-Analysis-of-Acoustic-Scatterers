%% exportNastran exports mesh to NASTRAN file
%  Creates file is NASTRAN - high-precision data format.
%  Data format: 8/16/16/16/16
%               8/16
%
%  INPUTS
%   nodes: coordinates of points, double [N x 3]
%   edges: pointers on nodes which represents edges of mesh, double [N x 2]
%   triangles: pointers on nodes which represents triangles of mesh, double [N x 3]
%   tetrahedrons: pointers on nodes which represents tetrahedrons of mesh, double [N x 4]
%   filePath: path to output directory, char [1 x N]
%   fileName: name of the NASTRAN file, char [1 x N]
%
%  SYNTAX
%
%  models.utilities.meshPublic.exportNastran(nodes, edges, triangles, tetrahedrons, path, name);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
