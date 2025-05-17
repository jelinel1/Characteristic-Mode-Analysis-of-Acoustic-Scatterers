%% getMeshData3D computes information necessary for MoM3D computations
%  This function loads data from tetrahedron mesh and outputs struct with
%  data necessary for MoM3D.
%
%  INPUTS
%   nodes: point coordinates, double [M x 3]
%   connectivityList: tetrahedrna connectivity, double [N x 4]
%   regions: tetrahedrna material regions, double [N x 1]
%   normDistance: normalization size, double [1 x 1]
%
%  OUTPUTS
%   meshData: structure with following items
%                -nodes, tetrahedrization nodes, double [N x 3]
%                -connectivityList, tetrahedrization connectivity list, double [N x 4]
%                -triangleAreas, area of each triangle, double [N x 1]
%                -triangleCentroids, center points of each triangle, double [N x 3]
%                -triangleNormals, normals of each triangle, double [N x 3]
%                -tetrahedronCentroids, centroid of each tetrahedron, double [N x 3]
%                -tetrahedronVolume, volume of each tetrahedron, double [N x 1]
%                -tetrahedronTriangles, triangles (facets) of each tetrahedron, double [N x 4]
%                -tetrahedronNormalSigns, normals' signs of each triangle, double [N x 4]
%                -tetrahedronRegions, material regions of tetrahedrons, double [N x 1]
%                -nRegions, number of material regions of tetrahedrons, double [1 x 1]
%                -nTetra, number of tetrahedrons, double [1 x 1]
%                -nTria, number of triangles, double [1 x 1]
%                -circumRadius, radius of circumsphere, double [1 x 1]
%                -normDistance, normalization of circumRadius and nodes, double [1 x 1]
%
%  SYNTAX
%
%  [meshData] = models.utilities.meshPublic.getMeshData3D(nodes,
%  connectivityList);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2020, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
