%% updatePolygon update Polygon parameters
% This function recomputes all dependent properties of specified object
% (Polygon) if any of its defining properties - points - is changed or set.
%
%  INPUTS
%   obj: Polygon [1 x 1]
%
%  SYNTAX
%
%  obj.updatePolygon
%
% All dependent properties of Polygon - drawPoints, area, circumference and
% center - are updated. The function geomUpdate is called at the end of
% updatePolygon.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
