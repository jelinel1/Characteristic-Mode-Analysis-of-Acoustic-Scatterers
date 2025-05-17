%% getEllipseArcLength compute length of ellipsearc
% This static method computes length of part of ellipseac specified by
% majorRadius, minorRadius, startAngle and arc angle.
%
%  INPUTS
%   majorRadius: major axis radius, double [N x 1]
%   minorRadius: minor axis radius, double [N x 1]
%   startAngle: start angle of arc, double [N x 1]
%   angle: arc length, double [N x 1]
%   tolerance: numrical tolerance, double [1 x 1]
%
%  OUTPUTS
%   length: length of ellipsearcs, double [N x 1]
%
%  SYNTAX
%
%  length = models.utilities.geomPublic.getEllipseArcLength(majorRadius, ...
% minorRadius, startAngle, angle)
%
% Function getEllipseArcLength computes length of ellipsearcs specified by its
% properties: _majorRadius_, _minorRadius_, _startAngle_, _angle_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
