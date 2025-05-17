%% getMeshStatistics computes statistics for the Mesh and each MeshObject
%  This function loads data from Mesh and Mesh Objects and outputs number
%  of triangle, number of nodes, average triangle quality and minimal
%  triangle quality, for Mesh and each MeshObject separately.
%
%  OUTPUTS
%   meshStatistics: structure with following items
%                    -numNodes, number of triangulation nodes, double [1 x 3]
%                    -numTriangles, number of triangles in
%                     the triangulation, double [1 x 3]
%                    -minQuality, minimal triangle quality, double [1 x 1]
%                    -avgQuality, average triangle quality, double [1 x 1]
%                    -objects, above mentioned statistics for each
%                     mesh object separately [N x 1]
%
%  SYNTAX
%
%  obj.getMeshStatistics();
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% docu
