%% getTriangleEdgeIndices creates list of triangle edges according to triangle nodes
%  This function constructs local edges inside given triangles, makes unique list
%  of them (_edges_) and expresses local edges as pointers (_connectivityList_).
%
%  INPUTS
%   connectivityList: list of triangle nodes, double [N x 3]
%   edges: sorted list of edges, double [N x 2]
%
%  OUTPUTS
%   triangleEdges: pointers to global list of edges, double [nTriangles x 3]
%
%  SYNTAX
%
%  [triangleEdges] =
%  models.utilities.meshPublic.getTriangleEdgeIndices(connectivityList, edges);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
