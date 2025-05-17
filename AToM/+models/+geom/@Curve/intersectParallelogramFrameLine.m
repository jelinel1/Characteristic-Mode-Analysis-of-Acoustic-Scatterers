%% intersectParallelogramFrameLine find intersection between Par. and Lines
% This static method finds intersection between one ParallelogramFrame and
% couple of Lines.
%
%  INPUTS
%   parFrame: ParallelogramFrame, struct [1 x 1]
%      .lowLeftCorner: low left corner point, double [1 x 3]
%      .lowRightCorner: low right corner point, double [1 x 3]
%      .highLeftCorner: high left corner point, double [1 x 3]
%      .highRightCorner: high right corner point, double [1 x 3]
%   lines: points of Line objects [2 x 3*N]
%
%  OUTPUTS
%   points: intersection points between curves, double [2 x 3*nLines]
%   status: double [1 x nLines]
%          0 - no intersection
%          1 - intersection in one point
%          2 - overlappping
%   param: parametric position of intersection points, double {2 x 2*nLines}
%
%  SYNTAX
%
%  [points, status, param] = models.geom.Curve.intersectParallelogramFrameLine(
% parfFrame, lines)
%
% Intersection points _points_ between the ParallelogramFrame _parFrame_ and
% Line objects _lines_ are computed. The variable _status_ indicates how
% intersection ends: 0 - no intersection, 1 - lines intersect in one or two
% points, 2 - line overlaps with any of parallelogramframes line.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Lukas Pospisil, BUT, lukas.pospisil@antennatoolbox.com
