%% reconstruct reinitiates EllipseArc object
% This function recomputes all dependent properties (not by means of OOP) of
% specified objec (EllipseArc) if any of its defining properties (_center_,
% _majorVertex_, _minorVertex_, _startAngle_, _angle_) is changed or set.
%
%  INPUTS
%   obj: EllipseArc object
%   callerName: name of calling function, char [1 x N]
%   varargin: always a pair - property, value
%
%  SYNTAX
%
%  obj.reconstruct(callerName)
%
% All defining properties of EllipseArc (_center_, _majorVertex_, _minorVertex_,
% _startAngle_, _angle_) are reinitiated according to actual values
% in Workspace. The depndent properties (_normal_, _focalPoints_, _majorRadius_,
% _minorRadius_, _majorAxisDir_, _minorAxisDir_, _drawPoints_,_startPoint_,
% _endPoint_) are recomputed.
%
%  obj.reconstruct(callerName, property, value)
%
% All dependent properties of EllipseArc are reinitiated according to actual
% values in Workspace. The _property_ (_center_, _majorVertex_, _minorVertex_,
% _startAngle_, _angle_) is et to new _value_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
