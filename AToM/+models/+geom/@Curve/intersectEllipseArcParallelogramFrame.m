%% intersectEllipseArcParallelogramFrame find intersect. between Par. and Lines
% This static method finds intersection between one EllipseArc and
% couple of ParallelogramFrame.
%
%  INPUTS
%   EllipseArc: struct of EllipseArc object [1 x 1]
%   parFrame: points of ParallelogramFrame objects [4 x 3*N]
%      1. row: low left corner points
%      2. row: low right corner points
%      3. row: high right corner points
%      4. row: high leftt corner points
%
%  OUTPUTS
%   points: intersection points between curves, double [8 x 3*nLines]
%   status: double [1 x nLines]
%          0 - no intersection
%          1 - intersection in one point
%   param: parametric position of intersection points, double {8 x 2*nLines}
%
%  SYNTAX
%
%  [points, status, param] = models.geom.Curve.
%  intersectEllipseArcParallelogramFrame(parfFrame, lines)
%
% Intersection points _points_ between the EllipseArc _ellipseArc_ and
% ParallelogramFrame objects _parFrame_ are computed. The variable _status_
% indicates how intersection ends: 0 - no intersection, 1 - intersect in
% one or more points (max 8 points).
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Lukas Pospisil, BUT, lukas.pospisil@antennatoolbox.com
