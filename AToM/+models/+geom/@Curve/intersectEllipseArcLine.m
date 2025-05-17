%% intersectLineLine find intersection points between Line and Ellipsearc
% This static method finds intersection between Lines segment and EllipseArc.
%
%  INPUTS
%   EllipseArc: struct of EllipseArc object [1 x 1]
%   Lines: points of Line objectst [2 x 3*N]
%   tol: tolerance, double [1 x 1]
%
%  OUTPUTS
%   points: intersection points between curves, double [N x 3*nLines]
%   status: double [1 x nLines]
%          0 - no intersection
%          1 - intersection in one or two points
%   param: parametric position of intersection points, double {2 x 2*nLines}
%
%  SYNTAX
%
%  [points, status, param] = models.geom.Curve.intersectEllipseArcLine( ...
% ElipseArc, Lines, tol)
%
% Intersection points _points_ between a Line and EllipseArc objects _Curve1_
% and _Curve2_ are computed. The variable _status_ indicates how intersection
% ends: 0 - no intersection, 1 - curves intersect in one or two points.
% The variable _param_ contains intersection expressedin form of parameter of
% curves: odd columns for EllipseArc, even columns for Lines.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
