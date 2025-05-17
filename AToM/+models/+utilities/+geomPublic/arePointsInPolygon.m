%% arePointsInPolygon determine if points are in polygon or not
% This function determines if 2D points are inside or outside of specified
% 2D polygon.
%
%  INPUTS
%   points: set of points, double [nPoints x 2]
%   polygon: nodes of polygon in CCW order, double [nNodes x 3]
%   holeSeg: hole indicator (1 solid, >1 hole), double [nNodes x 1]
%   tol: geom precision, double [1 x 1]
%
%  OUTPUTS
%   areIn: are points in or not, logical [nPoints x 1]
%
%  SYNTAX
%
%  areIn = models.utilities.geomPublic.arePointsInPolygon(points, polygon)
%
% Function arePointsInPolygon determines if 2D points _points_ are inside or
% outside of a polygon _polygon_. The computation is based on winding number
% according to http://geomalgorithms.com/a03-_inclusion.html.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
