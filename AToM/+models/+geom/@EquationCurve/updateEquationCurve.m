%% updateEquationCurve update EquationCurve parameters
% This function recomputes all dependent properties (not by means of OOP) of
% specified objec (EquationCurve) if any of its defining properties -
% _equationX_, _equationY_, _equationZ_, _paramInterval_ - is changed or set.
%
%  INPUTS
%   obj: EquationCurve object
%
%  OUTPUTS
%
%  SYNTAX
%
%  obj.updateEquationCurve
%
% All dependent properties of EquationCurve - drawPoints, startPoint, endPoint,
% center - are updated. The function geomUpdate is called at the end of
% updateEquationCurve.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
