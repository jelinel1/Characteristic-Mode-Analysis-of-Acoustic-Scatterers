%% getMeshData2D computes information necessary for MoM computations
%  This function loads data from mesh and outputs struct with data
%  necessary for MoM.
%
%  INPUTS
%   nodes: point coordinates, double [N x 3]
%   connectivityList: triangle vertices, double [N x 3]
%
%  OUTPUTS
%   meshData: structure with following items
%                -nodes, triangulation nodes, double [N x 3]
%                -connectivityList, triangulation connectivity list, double [N x 3]
%                -edges, triangulation edges, double [N x 2]
%                -edgeCentroids, center point of each edge, double [N x 3]
%                -edgeLengths, length of each edge, double [N x 1]
%                -triangleAreas, area of each triangle, double [N x 1]
%                -triangleCentroids, center points of each triangle, double [N x 3]
%                -triangleEdges, indices to edges, double [N x 3]
%                -triangleNormals, normals to each triangle, double [N x 3]
%                -nNodes, number of nodes, double [1 x 1]
%                -nEdges, number of edges, double [1 x 1]
%                -nTriangles, number of triangles, double [1 x 1]
%                -normDistanceA, radius of circumsphere, double [1 x 1]
%
%  SYNTAX
%
%  [meshData] = models.utilities.meshPublic.getMeshData2D(nodes,
%  connectivityList);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
