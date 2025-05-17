%% getMeshData1D computes information necessary for 1D mesh solvers
%  This function loads data from mesh and outputs struct with data necessary
%  for 1D mesh solvers.
%
%  OUTPUTS
%   meshData: structure with following items
%                -nodes, triangulation nodes, double [N x 3]
%                -edges, triangulation edges, double [N x 2]
%                -edgeLengths, center point of each edge, double [N x 3]
%                -edgeCentroids, length of each edge, double [N x 1]
%                -nNodes, number of nodes, double [1 x 1]
%                -nEdges, number of edges, double [1 x 1]
%                -nNodesBasic, number of nodes before symmetry, double [1 x 1]
%                -nEdgesBasic, number of edges before symmetry, double [1 x 1]
%
%  SYNTAX
%
%  obj.getMeshData1D();
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% docu
