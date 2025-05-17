%% reconstruct reinitiate Parallelogram object
% This function recomputes all dependent properties (not by means of OOP) of
% specified objec (Parallelogram) if any of its defining properties
% (_lowLeftCorner_, _lowRightCorner_, _highLeftCorner_) is changed or set.
%
%  INPUTS
%   obj: Parallelogram object
%   callerName: name of calling function, char [1 x N]
%   varargin: always a pair - property, value
%
%  SYNTAX
%
%  obj.reconstruct(callerName)
%
% All defining properties of Parallelogram (_lowLeftCorner_,
% _lowRightCorner_, _highLeftCorner_) are reinitiated according to actual
% values in Workspace. The dependent properties (_drawPoints_, _startPoint_,
% _endPoint_, _center_, _highRightCorner_, _normal_, _widthDir_, _heightDir_,
% _width_, _height_, _points_, _lines_) are recomputed.
%
%  obj.reconstruct(callerName, property, value)
%
% All defining properties of Parallelogram are reinitiated according to
% actual values in Workspace. The _property_ (_lowLeftCorner_, _lowRightCorner_,
% _highLeftCorner_) is set to new _value_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
