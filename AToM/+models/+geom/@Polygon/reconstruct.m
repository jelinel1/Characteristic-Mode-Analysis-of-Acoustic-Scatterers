%% reconstruct reinitiate Polygon object
% This function recomputes all dependent properties (not by means of OOP) of
% specified object (Polygon) if any of its defining properties (_points_) is
% changed or set.
%
%  INPUTS
%   obj: Polygon object
%   callerName: name of calling function, char [1 x N]
%   varargin: always a pair - property, value
%
%  OUTPUTS
%
%  SYNTAX
%
%  obj.reconstruct(callerName)
%
% All defining properties of PolyLine (_points_) are reinitiated according to
% actual values in Workspace. The dependent properties (_center_,
% _circumference_, _area_) are recomputed.
%
%  obj.reconstruct(callerName, property, value)
%
% All defining properties of Polygon are reinitiated according to actual
% values in Workspace. The _property_ (_points_) is set to new _value_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
