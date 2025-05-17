%% isInPolyCurve check if new object is in PolyLoop
% When new object is to be added to existing PolyLoop, this routine finds out
% if the added object is allready in the PolyLoop object or not.
%
%  INPUTS
%   obj: PolyLoop object
%   curveObj: curve to be added
%
%  OUTPUTS
%   ID: 0 - new Curve/N - Curve is in PolyCurve at N-th place, double [1 x 1]
%
%  SYNTAX
%
%   ID = obj.isInPolyLoop(curveObj)
%
% A novel Curve object _curveObj_ (Line, EllipseArc, EquationCurve) is checked
% if is allready in PolyCurve object _obj_ (_ID_ = N) at M-th place or not
% (_ID_ = 0).
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
