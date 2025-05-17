%% updateLine update Line parameters
% This function recomputes all dependent properties (not by means of OOP) of
% specified object (Line) if any of its defining properties - points - is
% changed.
%
%  INPUTS
%   obj: Line object
%
%  SYNTAX
%
%  obj.updateLine
%
% All dependent properties of Line - drawPoints, center - are updated.
% The function geomUpdate is called at the end of updateLine.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
