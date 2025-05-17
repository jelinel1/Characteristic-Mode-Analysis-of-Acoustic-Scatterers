%% intersectEqCurveEqCurve find intersections between Eq..Curve and Eq..Curves
% This static method finds intersection between EquationCurve and another
% EquationCurves.
%
%  INPUTS
%   eqCurve: struct of EquationCurve object, struct [1 x 1]
%   eqCurves: struct of EquationCurve objects, struct [1 x 1]
%   maxIter: optional, maximal number of iterations, double [1 x 1]
%   nDiv: optional, number of curve sample points, double [1 x 1]
%   tolerance: optional, geometric tolerance, double [1 x 1]
%
%  OUTPUTS
%   points: intersection points between curves, cell [1 x nCurves]
%   status: double [1 x nCurves], cell [1 x nCurves]
%          0 - no intersection
%          1 - intersection in one or more points
%   param: parametric position of intersection points, cell [1 x nCurves]
%
%  SYNTAX
%
%  [points, status, param] = models.geom.Curve.intersectEqCurveEqCurve( ...
% eqCurve, eqCurves)
%
% Intersection points _points_ between a EquationCurve and EquationCurve objects
% _eqCurve_ and _eqCurves_ are computed. The variable _status_ indicates how
% intersection ends: 0 - no intersection, 1 - curves intersect in one or two
% points. The variable _param_ contains intersection expressedin form of
% parameter of curves: odd columns for EllipseArc, even columns for Lines.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
