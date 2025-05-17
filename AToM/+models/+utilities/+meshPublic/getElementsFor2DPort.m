%% getElementsForPort returns elements suitable for creation of 2D mesh port at
% specific position.
% Function finds an edge with its center closest to the portPosition, identify
% its nodes and find elements of mesh containing these nodes. If the edge is
% shared between more elements, all of them are returned. Fields from
% mesh.getMeshData2D can be used as inputs.
%
%  INPUTS
%   portPosition: position of port, double [1 x 3]
%   edges: set of edges in triangulation connectivityList, double [M x 2]
%   triangleEdgeCenters: center points of all edges, double [M x 3]
%   connectivityList: points number for each triangle, double [N x 3]
%
%  OUTPUTS
%   elements: element numbers which are sharing one edge, double [L x 1]
%   closestEdge: edge with the center closest to the portPosition,
%                double [1 x 1]
%   nodes: nodes of the odge shared between the elements, double [2 x 1]
%
% (c) 2019, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
% mcode
