%% isTriangleCounterClockWise find out if triangle is CCW or not
% This function finds out if triangle specified by three points in order:
% _point1_, _point2_ and _point3_ is in CCW }counterclockwise] order or in CW
% (clockwise order).
%
%  INPUTS
%   point1: first point position, double [1 x 3] in [m]
%   point2: second point position, double [1 x 3] in [m]
%   point3: third point position, double [1 x 3] in [m]
%   varargin:
%            tolerance: geometry tolerance, double [1 x 1] in [m]
%
%  OUTPUTS
%   isCCW: true = counterclockwise, false = clockwise, logical [1 x 1]
%   inLine: true = all points in one line, false = triangle, logical [1 x 1]
%
%  SYNTAX
%
%  [isCCW, inLine] = models.utilities.geomPublic.isTriangleCounterClockWise( ...
% point1, point2, point3, tolerance)
%
% Function isTriangleCounterClockWise is used to determine if triangle specified
% by three points _point1_, _point2_ and _point3_ is in CCW order
% (_isCCW_ = true) or in CW order (_isCCW_ = false). The tolerance of geometry
% is set to first value in _varargin_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
