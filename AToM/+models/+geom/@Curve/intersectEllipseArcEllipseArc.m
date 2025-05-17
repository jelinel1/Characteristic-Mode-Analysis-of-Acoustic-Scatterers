%% intersectEllipseArcEllipseArc find intersection points two Ellipsearcs
% This static method finds intersection between segments of tw EllipseArcs.
%
%  INPUTS
%   EllipseArc1: struct of EllipseArc object [1 x 1]
%     .center: center position, double [1 x 3]
%     .majorVertex: major vertex position, double [1 x 3]
%     .minorVertex: minor vertex position, double [1 x 3]
%     .startAngle: arc starting angle value, double [1 x 1]
%     .sangle: arc angular length, double [1 x 1]
%   EllipseArc2: struct of EllipseArc object [1 x 1]
%
%  OUTPUTS
%   points: intersection points between curves, double [N x 3]
%   status: double [1 x 1]
%          0 - no intersection
%          1 - intersection in one or two points
%          2 - overlaping parts
%   param: parametric position of intersection points, double {N x 2}
%
%  SYNTAX
%
%  [points, status, param] = ...
% models.geom.Curve.intersectEllipseArcEllipseArc(EllipseArc1, EllipseArc2)
%
% Intersection points _points_ between two EllipseArc objects _EllipseArc1_
% and _EllipseArc2_ are computed. The variable _status_ indicates how
% intersection ends: 0 - no intersection, 1 - curves intersect in one to four
% points, 2 - arc parts are overlapping. The variable _param_ contains
% intersection expressedin form of parameter of curves: odd columns for
% ElllipseArc1, even columns for EllipseArc2. Newton iterative root finding
% method is used for intersection computation.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
