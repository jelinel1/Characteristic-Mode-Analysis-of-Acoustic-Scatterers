%% canTwoCurvesIntersect find if two curves defined by points can intersect
% This static method finds if intersection between two curves is possible.
%
%  INPUTS
%   curve1: points of curve1, double [2 x 3]
%   curve2: points of curve2, double [2 x 3]
%
%  OUTPUTS
%   canIntersect: can intersect or not, logical [1 x 1]
%
%  SYNTAX
%
%  canIntersect = models.geom.Curve.canTwoCurvesIntersect(curve1, curve2)
%
% This method compares min and max points of individual curves _curve1_ and
% _curve2_ and states if they can intersect or not.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
