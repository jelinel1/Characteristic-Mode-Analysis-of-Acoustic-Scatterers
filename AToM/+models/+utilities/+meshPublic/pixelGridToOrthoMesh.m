%% pixelGridToOrthoMesh generates mesh from matrix full of integer numbers
%  Each entry is considered as a pixel of size d (by default d = 1)
%
%  INPUTS
%     M: matrix of integer numbers denoting type of mesh in that pixel
%
%  INPUTS
%   (optional)
%     d: size of the pixel (by default d = 1)
%
%  OUTPUTS
%     nodes: triangulation nodes, double [N x 3]
%     connectivityList: triangulation connectivity list, double [N x 3]
%     Mesh: mesh grid in AToM format
%
%  SYNTAX
%
%  [nodes, connectivityList, Mesh = ...
%         models.utilities.meshPublic.pixelGridToOrthoMesh(ones(10, 5), 1);
%
%  Type of elementary mesh cells:
%   M(i,j) = +1 pixel has two triangles with "7-2 hours" diagonal
%   M(i,j) = -1 pixel has two triangles with "5-11 hours" diagonal
%   M(i,j) = +2 pixel has four triangles devided by two diagonals X
%
%  The final mesh is centered around the origin of the coordinate system.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018-2021, Miloslav Capek, CTU in Prague, miloslav.capek@fel.cvut.cz
% mcode docu
