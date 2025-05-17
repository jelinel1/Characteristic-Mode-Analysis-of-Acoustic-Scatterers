%% uniformTriangulation2D creates regular uniform triangulation over given polygon in 3D
%  This function takes boundary nodes of polygon which should be meshed.
%  Boundary and hole points must be ordered counter clockwise.
%
%  INPUTS
%   boundaryNodes: point coordinates, double [N x 2]
%   holes: a cell with points of holes, might be an empty cell, cell [1 x 1]
%     containint matrices double [N x 2]
%   elemSize: euclidean distance between points, double [1 x 1]
%   meshType: type of triangles used for meshing, string [1 x N]
%             options: right, equilateral
%
%  OUTPUTS
%   nodes: new set of nodes, double [N x 2]
%   connectivityList: new set of connections, double [N x 3]
%
%  SYNTAX
%
%  [nodes, connectivityList] = models.utilities.meshPublic.
%     uniformTriangulation2D(boundaryPoints, holes, elemSize, meshType);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
