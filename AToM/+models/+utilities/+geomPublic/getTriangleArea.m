%% getTriangleArea compute signed area of triangle
% This function computes signed area of triuangle defined by three
% points: _point1_, _point2_ and _point3_.
%
%  INPUTS
%   point1: first point position, double [1 x 3] in [m]
%   point2: second point position, double [1 x 3] in [m]
%   point3: third point position, double [1 x 3] in [m]
%
%  OUTPUTS
%   area: signed area of triangle, double [1 x 1] in [m^2]
%
%  SYNTAX
%
%  area = models.utilities.geomPublic.getTriangleArea(point1, point2, point3)
%
% Function getTriangleArea computes signed area of triangle defined by three
% points: _point1_, _point2_ and _point3_. The resulting area is: I] area > 0 -
% points are in CCW order, II] area < 0 - points in CW order, III] area = 0 -
% points are in one line.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
