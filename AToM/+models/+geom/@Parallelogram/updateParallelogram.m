%% updateParallelogram update Parallelogram parameters
% This function recomputes all dependent properties (not by means of OOP) of
% specified object if any of its defining properties - _lowLeftCorner_,
% _lowRightCorner_, _highLeftCorner_ - is changed or set.
%
%  INPUTS
%   obj: Parallelogram object
%
%  SYNTAX
%
%  obj.updateParallelogram
%
% All dependent properties of Parallelogram _obj_ are updated. The function
% geomUpdate is called at the end of _updateParallelogram_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
