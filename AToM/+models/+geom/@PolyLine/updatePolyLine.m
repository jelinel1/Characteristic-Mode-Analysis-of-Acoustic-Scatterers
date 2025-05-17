%% updatePolyLine update PolyLine parameters
% This function recomputes all dependent properties of specified object
% (PolyLine) if any of its defining properties - points - is changed or set.
%
%  INPUTS
%   obj: PolyLine [1 x 1]
%
%  SYNTAX
%
%  obj.updatePolyLine
%
% All dependent properties of PolyLine - drawPoints and center -
% are updated. The function geomUpdate is called at the end of updatePolyLine.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
