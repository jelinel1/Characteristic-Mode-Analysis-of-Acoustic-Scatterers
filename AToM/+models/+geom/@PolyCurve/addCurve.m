%% addCurve add new Curve to PolyCurve
% New Curve object is added to existing PolyCurve object. The function calls
% routines to find junctions with all other Curves in PolyCurve object.
%
%  INPUTS
%   obj: PolyCurve object
%   curveObj: curve to be added
%
%  SYNTAX
%
%  obj.addCurve(curveObj)
%
% A novel Curve object _curveObj_ (Line, EllipseArc, EquationCurve,
% Parllelogramframe) is added to the existing PolyCurve object _obj_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
