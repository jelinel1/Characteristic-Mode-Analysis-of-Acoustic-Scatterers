%% getPointsFromParams get position of points on GeomObject
% This function throws back position of point lying on GeomObject and specified
% by parameter of the object.
%
%  INPUTS
%   obj: Geom [1 x 1]
%   objName: GeomObject, char [1 x N]
%   params: parametric position of wanted points, double [1, 2 x N]
%   type: optional, type of GeomObject
%
%  SYNTAX
%  points = obj.getPointsFromParams(objName, params)
%
% Points on object specified by _objName_ are computed from parametric
% expression in _params_. Parameters goes from [0, 1]. Meaning of params for
% individual object types:
%  Line - double [1 x N] - normalized length
%  EquationCurve - double [1 x N] - parameter from paramInterval for handles
%  EllipseArc - double [1 x N] - angle between startAngle and startAngle + angle
%  Parallelogram - double [1 x N] - [0, 0.25] = lowLeft - lowRight,
%     [0.25, 0.5] = lowRight - highRight, [0.5, 0.75] = highRight - highLeft,
%     [0.75, 1] = highLeft - lowLeft
%  Ellipse - double [2 x N] - first row - angle as in EllipseArc
%                           - second row / distance between center and arc point
%                             defined by first row
%  Parallelogram - double [2 x N] - point defined by:lowLeft + ...
%                                   params(1, :)*(lowRight - lowLeft) + ...
%                                   params(2, :)*(highLeft - lowLeft)
%
%  points = getPointsFromParams(objName, params, type)
%
% Search for GeomObject _objName_ reference is performed faster thanks to ...
% specified _type_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
