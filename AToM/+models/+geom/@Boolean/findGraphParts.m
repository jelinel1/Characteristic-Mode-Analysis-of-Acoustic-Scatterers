%% findGraphParts finds graphs from Segments
% This method finds graph nodes for defined object.
%
%  INPUTS
%   segments: start Point, end Point of segments, double [2*nSegments x 3]
%
%  OUTPUTS
%   graphs: resulting graph seg numbers, cell [1 x nGr] - double [1 x nSeg]
%   isClosed: isGraph closed, logical [1 x nGr]
%
%  SYNTAX
%
%  [graphs, isClosed] = models.geom.Boolean.findGraphParts(segments)
%
% Graph segments numbers _graph_ are found from _segments_ 3D points.
% Cell _graphs_ contains num,bers of segments that form disjunct graph
% parts. Logical _isClosed_ indicates, if coresponding graph part is closed
% (forms a polygon) or not.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
