%% reconstruct reinitiates EquationCurve object
% This function recomputes all dependent properties (not by means of OOP) of
% specified objec (EquationCurve) if any of its defining properties
% (_equationX_, _equationY_, _equationZ_, _paramInterval_) is changed or set.
%
%  INPUTS
%   obj: EquationCurve object
%   callerName: name of calling function, char [1 x N]
%   varargin: always a pair - property, value
%
%  OUTPUTS
%
%  SYNTAX
%
%  obj.reconstruct(callerName)
%
% All defining properties of EquationCurve (_equationX_, _equationY_,
% _equationZ_, _paramInterval_) are reinitiated according to actual values in
% Workspace. The dependent properties (_drawPoints_, _startPoint_, _endPoint_,
% _center_) are recomputed.
%
%  obj.reconstruct(callerName, property, value)
%
% All defining properties of EquationCurve are reinitiated according to actual
% values in Workspace. The _property_ (_equationX_, _equationY_, _equationZ_ or
% _paramInterval_) is et to new _value_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
