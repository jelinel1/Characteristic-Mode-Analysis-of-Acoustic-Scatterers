%% intersectLineLine find intersection points between line and set of lines
% This static method finds intersection between a line and set of lines.
%
%  INPUTS
%   line1: points of Line object, double [2 x 3]
%   lineSet: points of Line objects, double [2 x 3*N]
%
%  OUTPUTS
%   points: intersection points between curves, double [N x 3*nLines]
%   status: double [1 x nLines]
%          0 - no intersection
%          1 - intersection in one point
%          2 - overlappping
%   param: parametric position of intersection points, double {2 x 2*nLines}
%
%  SYNTAX
%
%  [points, status, param] = models.geom.Curve.intersectLineLine(line1, lineSet)
%
% Intersection points _points_ between a line _line1_ and set of lines _lineSet_
% are computed. The variable _status_ indicates how intersection ends: 0 - no
% intersection, 1 - lines intersect in one point, 2 - lines overlap between
% _points(1,:)_ and _points(2,:)_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
