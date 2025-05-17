%% updateParallelogramFrame update ParallelogramFrame parameters
% This method recomputes all dependent properties (not by means of OOP) of
% specified objec (ParallelogramFrame) if any of its defining properties -
% lowLeftCorner, lowRightCorner, highLeftCorner - is changed or set.
%
%  INPUTS
%   obj: ParallelogramFrame object
%
%  OUTPUTS
%
%  SYNTAX
%
%  obj.updateParallelogramFrame
%
% All dependent properties of ParallelogramFrame - _drawPoints_, _startPoint_,
% _endPoint_, _center_, _highRightCorner_, _normal_, _widthDir_, _heightDir_,
% _width_, _height_, _points_, _lines_ - are updated. The function geomUpdate is
% called at the end of updateParallelogramFrame.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
