%% pixelGridToHexaMesh generates hexagonal mesh from matrix of indices
%  Each entry is considered as a pixel of size d (by default d = 1)
%
%  INPUTS
%     M: matrix of integer numbers
%
%  INPUTS
%   (optional)
%     d: size of the pixel (by default d = 1)
%
%  OUTPUTS
%     nodes:
%     connectivityList:
%     Mesh: mesh grid in AToM format
%
%  SYNTAX
%
%  [nodes, connectivityList, Mesh = ...
%         models.utilities.meshPublic.pixelGridToHexaMesh(ones(10, 5), 1);
%
%  Type of elementary mesh cells:
%   M(i,j) = 0 pixel is filled by void
%   M(i,j) = 1 pixel is filled my metalization
%
%  One pixel is composed of two adjacent equilateral triangles.
%
%  The final mesh is centered around the origin of the coordinate system.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2021, Miloslav Capek, CTU in Prague, miloslav.capek@fel.cvut.cz
% mcode docu
