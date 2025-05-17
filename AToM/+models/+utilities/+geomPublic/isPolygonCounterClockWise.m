%% isPolygonCounterClockWise find out if polygon is CCW or not
% This function finds out if polygon specified by ordered points is in CCW
% (counterclockwise] order or in CW (clockwise) order.
%
%  INPUTS
%   points: points of polygon, double [N x 3] in [m]
%   varargin:
%            tolerance: geometry tolerance, double [1 x 1] in [m]
%
%  OUTPUTS
%   isCCW: true = counterclockwise, false = clockwise, logical [1 x 1]
%   inLine: true = all points in one line, false = triangle, logical [1 x 1]
%
%  SYNTAX
%
%  [isCCW, inLine, area] = ...
% models.utilities.geomPublic.isPolygonCounterClockWise(points, tolerance)
%
% Function isPolygonCounterClockWise is used to determine if polygon specified
% by N 3D points _points_ is in CCW order (_isCCW_ = true) or in CW order
% (_isCCW_ = false). The tolerance of geometry is set to first value in
% _varargin_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
