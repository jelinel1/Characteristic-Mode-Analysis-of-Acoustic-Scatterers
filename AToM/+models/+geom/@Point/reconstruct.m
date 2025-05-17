%% reconstruct reinitiate Point object
% This function recomputes all dependent properties (not by means of OOP) of
% specified objec (Point) if any of its defining properties(_coordVal_) is
% changed or set.
%
%  INPUTS
%   obj: Point object
%   callerName: name of calling function, char [1 x N]
%   varargin: always a pair - property, value
%
%  OUTPUTS
%
%  SYNTAX
%
%  obj.reconstruct(callerName)
%
% All defining properties of Point (_coordVal_,) are reinitiated according to
% actual values in Workspace. The dependent properties are recomputed.
%
%  obj.reconstruct(callerName, property, value)
%
% All defining properties of ParallelogramFrame are reinitiated according to
% actual values in Workspace. The _property_ (_coordVal_) is set to new _value_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
