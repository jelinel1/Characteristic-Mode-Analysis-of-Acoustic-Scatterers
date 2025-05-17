%% getCycles find cycles among segments
% This static method finds cycles from  set of segments.
%
%  INPUTS
%   segments: segments - startPoint;endPoint..., double [2*nSeg x 3]
%   tolerance: relative tolerance of points, double [1 x 1]
%
%  OUTPUTS
%   order: resulting segment numbers, cell [1 x nCyc], double [1 x nSegments]
%   dir: direction of segment, 0 same, 1 change, logical [1 x 1]
%
%  SYNTAX
%
%  [order, dir] = models.geom.Boolean.getCycles(segments, tolerance)
%
% Intersection _polygon_ between two GeomObjects _obj1_ and _obj2_ are computed.
% The objects are not modified.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
