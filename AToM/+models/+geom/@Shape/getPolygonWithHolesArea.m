%% getPolygonWithHolesArea compute area of 2D GeomObject
% This function determines area of polygon, that can include holes.
%
%  INPUTS
%   polygon: nodes of polygon in CCW order, double [nPoints x 2]
%   holeSeg: nodes of polygon in CCW order, [nNodes x 3]
%
%  OUTPUTS
%   area: are points in or not, logical [nPoints x 1]
%
%  SYNTAX
%
%  [area, normal] = models.geom.Boolean.getPolygonWithHolesArea( ...
% polygon, holeSeg)
%
% Function getPolygonWithHolesArea computes area of a polygon points specified
% by 2D points _polygon_ including points defining holes. Variable _holeSeg_
% identifies solid (1) or hole points (>2).
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
