%% removeCurveFromPolyCurve remove curve from PolyCurve object
% This method removes a curve from PolyCurve object.
%
%  INPUTS
%   obj: Geom object, [1 x 1]
%   namePolyCurve: PolyCurve name, char [1 x N]
%   nameCurve: Curves to be removed names, char [1 x N]
%
%  OUTPUTS
%   isRemoved: logical [1 x 1]
%
%  SYNTAX
%
%  isRemoved = obj.removeCurveFromPolyCurve(namePolyCurve, nameCurve)
%
% Curves specified by _nameCurve_ are removed from PolyCurve object specified
% by namePolyCurve.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
