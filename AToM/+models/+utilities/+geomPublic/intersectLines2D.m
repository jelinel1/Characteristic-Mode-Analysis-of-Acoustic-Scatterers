%% intersectLines2D find intersection points between two sets of lines
% This static method finds intersection between two sets of lines in 2D plane.
%
%  INPUTS
%   line1: points of set1 lines, double [2 x 2*N1]
%   lines: points of set2 lines, double [2 x 2*N2]
%   tol: geometrical precision, double [1 x 1]
%
%  OUTPUTS
%   points: intersection points between curves, cell [N1 x N2]
%   status: double [N1 x N2]
%          0 - no intersection
%          1 - intersection in one point
%          2 - overlappping
%   param: parametric position of intersection points, cell [N1 x N2]
%
%  SYNTAX
%
%  [points, status, param] = models.utilities.geomPublic. ...
% intersectLines2D(line1, line2)
%
% Intersection points _points_ between a set of lines _line1_ and set of lines
% _line2_ are computed in 2D. The variable _status_ indicates how intersection
% ends: 0 - no intersection, 1 - lines intersect in one point, 2 - lines overlap
% between _points(1,:)_ and _points(2,:)_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
