%% getTriangleAreas return triangle areas
%
%  INPUTS
%   nodes: node coordinates, double [nNodes x 3]
%   triangleNodes: triangle node indices, double [nTriangles x 3]
%   edgeLengths: triangle edge lengths, double [nTriangles x 1]
%   triangleEdges: triangle edge indices, double [nTriangles x 3]
%
%  OUTPUTS
%   triangleAreas: triangle areas, double [N x 1]
%
%  SYNTAX
%
%  triangleAreas = getTriangleAreas(nodes, triangleNodes)
%
%   Triangle areas are computed using nodes and triangle nodes. Edge lengths
%   have to be computed here (slower).
%
%   triangleAreas = getTriangleAreas([], [], edgeLengths, triangleEdges)
%
%   Triangle areas are computed using already computed edge lengths (faster).
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Ondrej Kratky, CTU in Prague, ondrej.kratky@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, VUT Brno, vladimir.sedenka@antennatoolbox.com
% mcode docu
