%% updateCurve add new Curve to PolyCurve
% A Curve of PolyCurve object was changed. The PolyCurve object _obj_ has to be
% updated - find junctions of changed Curve with all other Curves in PolyCurve
% object.
%
%  INPUTS
%   obj: PolyCurve object
%   curveObj: curve to be added
%
%  SYNTAX
%
%  obj.updateCurve(curveObj)
%
% A Curve object _curveObj_ (Line, EllipseArc, EquationCurve,
% Parllelogramframe) allready present in PolyCurve object _obj_ was changed.
% The junctions of _curveObj_ has to be updated and the the whole PolyCurve
% object is updated.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
