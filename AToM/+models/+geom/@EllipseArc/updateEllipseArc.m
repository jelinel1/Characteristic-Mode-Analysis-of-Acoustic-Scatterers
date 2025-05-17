%% updateEllipseArc update EllipseArc parameters
% This function recomputes all dependent properties (not by means of OOP) of
% specified object (_EllipseArc_) if any of its defining properties - _center_,
% _majorVertex_, _minorVertex_, _startAngle_, _angle_ - is changed or set.
%
%  INPUTS
%   obj: EllipseArc object
%
%  SYNTAX
%
%  obj.updateEllipseArc
%
% All dependent properties of _EllipseArc_ - _normal_, _focalPoints_,
% _majorRadius_, _minorRadius_, _majorAxisDir_, _minorAxisDir_, _drawPoints_,
% _startPoint_, _endPoint_ - are updated. The function geomUpdate is called
% at the end of _updateEllipseArc_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
