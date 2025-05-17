%% meshToPolygon creates polygon from mesh
%  Creates counter clockwise representation of mesh boundary.
%
%  INPUTS
%   nodes: set of nodes, double [N x 2]
%   connectivityList: set of node connections, double [N x 3]
%
%  OUTPUTS
%   polygons: cell of points for each polygon, cell [1 x N]
%   err: error when points aren't in one plane, logical [1 x 1]
%
%  SYNTAX
%
%  [polygons] = models.utilities.meshPublic.meshToPolygon(nodes,
%  connectivityList);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
