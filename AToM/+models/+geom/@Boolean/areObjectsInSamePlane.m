%% areObjectsInSamePlane specify if objects are in the smae plane
% This method checks if object parts lay in the same plane or not. If not,
% numbers of segments in different
%
%  INPUTS
%   obj: Boolean [1 x 1]
%   obj1: first object, GeomObject  [1 x 1]
%   obj2: second object, GeomObject  [1 x 1]
%
%  OUTPUTS
%   samePlanes: indesces of parts in same plane, double [nSame x 2]
%   intersectPlanes: indeces of parts with intersect. planes, double [nDif x 2]
%   areParallel: indesces of parts in parallel planes, double [nParallel x 2]
%
%  SYNTAX
%
%  [allSame, difNums,areParallel] = ...
% models.geom.boolean.areObjectsInSamePlane(obj1, obj2, tol)
%
% Two objects _obj1_ and _obj2_ are checked by segmentation parts, if they are
%  in the same plane or not.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
