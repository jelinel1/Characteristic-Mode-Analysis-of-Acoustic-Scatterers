%% getTetrahedronFace2CenterNormals returns normals of all face to tetrahedra center normals
%
%  INPUTS
%   triangleCentroids: centroid of each triangle, double [N x 3]
%   tetrahedronCentroids: centroid points of each tetrahedron, double [N x 3]
%   tetrahedronTriangles: tetrahedron of each triangle, double [N x 1]
%   triangleNormals: triangle normals, double [N x 3]
%
%  OUTPUTS
%   normals:
%   signs: signs of each normal [N x 1]
%
%  SYNTAX
%
%  [normals, signs] = models.utilities.meshPublic.getTetrahedronFace2CenterNormals(...
%  triangleCentroids, tetrahedronCentroids, tetrahedronTriangles, triangleNormals);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2020, Martin Strambach, CTU, martin.strambach@antennatoolbox.com
% mcode docu
