%% removeCurve remove Curve from PolyCurve
% A Curve at position _ID_ is to be removed from PolyCurve object _obj_.
% The junctions of deleted Curve has to be deleted also. The segments of curves
% having junctions with removed Curve has to be updated.
%
%  INPUTS
%   obj: PolyCurve object
%   ID: ID of Curve to be removed, double [1 x 1]
%
%  SYNTAX
%
%  obj.removeCurve(ID)
%
% A Curve object obj.curve(ID) (Line, EllipseArc, EquationCurve,
% Parllelogramframe) is removed from the PolyCurve object _obj_. The junctions
% of _ID_-th Curve are deleted and segments having junctions with removed Curve
% are updated.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
