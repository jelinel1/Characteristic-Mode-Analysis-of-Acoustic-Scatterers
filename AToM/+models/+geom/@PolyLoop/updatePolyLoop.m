%% updatePolyLoop update properties of PolyLoop
% Update the PolyLoop whenever any of the Curve building the PolyLoop has been
% changed. The function calls routines to find cycles.
%
%  INPUTS
%   obj: PolyLoop object
%
%  SYNTAX
%
%  obj.updatePolyLoop
%
% After any of Curves (Line, EllipseArc, EquationCurve)
% building the PolyLoop object _obj_  is changed, the whole PolyLoop _obj_ is
% updated - curves are reordered and new properties are computed.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
