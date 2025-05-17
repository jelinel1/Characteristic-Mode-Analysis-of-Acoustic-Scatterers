%% updatePolyCurve update properties of PolyCurve
% Update the PolyCurve whenever any of the Curve building the PolyCurve has been
% changed. The function calls routines to find cycles.
%
%  INPUTS
%   obj: PolyCurve object
%
%  SYNTAX
%
%  obj.updatePolyCurve
%
% After any of Curves (Line, EllipseArc, EquationCurve, Parllelogramframe)
% building the PolyCurve object _obj_  is changed, the whole PolyCurve _obj_ is
% updated - new possible cycles are found.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
