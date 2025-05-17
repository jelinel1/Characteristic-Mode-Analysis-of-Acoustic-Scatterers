%% getMeshData2D computes information necessary for MoM computations
%  This function loads data from mesh and outputs struct with data necessary
%  for MoM
%
%  OUTPUTS
%   meshData: structure with following items
%                -nodes, triangulation nodes, double [N x 3]
%                -connectivityList, triangulation connectivity list, double [N x 3]
%                -edges, triangulation edges, double [N x 2]
%                -triangleEdgeCenters, center point of each edge, double [N x 3]
%                -triangleEdgeLengths, length of each edge, double [N x 1]
%                -triangleAreas, area of each triangle, double [N x 1]
%                -triangleCentroids, center points of each triangle, double [N x 3]
%                -triangleEdges, indices to edges, double [N x 3]
%                -nNodes, number of nodes, double [1 x 1]
%                -nEdges, number of edges, double [1 x 1]
%                -nTriangles, number of triangles [1 x 1]
%                -normDistanceA, radius of circumsphere, double [1 x 1]
%                -nNodesBasic, number of nodes before symmetry, double [1 x 1]
%                -nEdgesBasic, number of edges before symmetry, double [1 x 1]
%                -nTrianglesBasic, number of triangles
%                 before symmetry, double [1 x 1]
%                -edgeOrigins, edges origins before symmetry, double [N x 1]
%                -triangleOrigins, triangles origins before symmetry, double [N x 1]
%
%  SYNTAX
%
%  obj.getMeshData2D();
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% docu
