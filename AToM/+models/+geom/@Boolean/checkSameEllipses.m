%% checkSameEllipses checks if two EllipseArcs are same
% This method finds if two Ellipse/EllipseArc objects are same - according
% to definition.
%
%  INPUTS
%   eli1: first Ellipse, Ellipse/EllipseArc object [1 x 1]
%   eli2: second Ellipse, Ellipse/EllipseArc object [1 x 1]
%
%  OUTPUTS
%   areSame: logical [1 x 1]
%
%  SYNTAX
%
%  areSame = models.geom.Boolean.checkSameEllipses(eli1, eli2)
%
% Two Ellipses/EllipseArc object _eli1_ and _eli2_ are chekce, if theie
% definition is asmae - same center, majorRadiuses and minorRadiuses can be
% different but forming the same drawPoints.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
