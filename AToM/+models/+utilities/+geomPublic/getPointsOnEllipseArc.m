%% getPointsOnEllipseArc compute points on ellipse arc
% This function computes position of points that defines an EllipseArc.
%
%  INPUTS
%   nPoints: number of points on EllipseArc, double [1 x 1]
%   center: EllipseArc center position, double [1 x 3]
%   majorVertex: EllipseArc major vertex point, double [1 x 3]
%   minorVector: EllipseArc minor vertex point, double [1 x 3]
%   startAngle: EllipseArc start angle, double [1 x 1]
%   angle: EllipseArc angle, double [1 x 1]
%
%  OUTPUTS
%   dP: drawPoints, double [nPoints x 3]
%
%  SYNTAX
%
%  dP = getPointsOnEllipseArc(nPoints, center, majorVector, minorVector,
% startAngle, angle)
%
% Points _dP_ are computed on the EllipseArc defined by _center_, _majorVertex_,
% _minorVertex_, _startAngle_, _angle_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
