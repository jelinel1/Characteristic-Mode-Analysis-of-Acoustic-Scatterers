%% addCurveToPolyCurve add curve to PolyCurve object
% This method adds a curve to PolyCurve object.
%
%  INPUTS
%   obj: Geom object, [1 x 1]
%   namePolyCurve: PolyCurve name, char [1 x N]
%   nameCurve: Curves to be added (names), char [1 x N]
%   type: optional, GeomObjectType [1 x N]
%
%  OUTPUTS
%   isAdded: logical [1 x 1]
%
%  SYNTAX
%
%  isAdded = obj.addCurveToPolyCurve(namePolyCurve, nameCurve)
%
% Curves specified by _nameCurve_ are added to PolyCurve object specified
% by namePolyCurve.
%
%  isAdded = obj.addCurveToPolyCurve(namePolyCurve, nameCurve, type)
%
% Curves specified by _nameCurve_ are added to PolyCurve object specified
% by namePolyCurve. When _type_ is specified for every curve, the search
% within Geom object is performed faster.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
