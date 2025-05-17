%% createIntersectLineAndSegments create intersection line
% This method finds intersection line of two obejcts in different planes.
% Segements of the two objects are divided at intersection points.
%
%  INPUTS
%   obj1: object of interest 1, GeomObject [1 x 1]
%   obj2: object of interest 2, GeomObject [1 x 1]
%   intersectPlanes: indices of intersecting parts, double [nInt x 2]
%
%  SYNTAX
%
%  obj1.createIntersectLineAndSegments(obj2, intersectPlanes)
%
% Method createIntersectLineAndSegments finds intersection line of two parts of
% objects _obj1_ and _obj2_ that lays in different planes. Segments of the two
% objects are divided in intersection pointts with intersecting line.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
