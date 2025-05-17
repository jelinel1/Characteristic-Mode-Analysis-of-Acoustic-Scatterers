%% euclideanDistanceBetweenTwoSetsSqrt compute distance between sets of points
% This function computes Euclidean distance between two sets of points. It
% is more robust variant of function:
% models.utilities.geomPublic.euclideanDistanceBetweenTwoSets
%
%  INPUTS
%   set1: first set of points, double [nPoints x nDims]
%   set2: second set of points, double [mPoints x nDims]
%   tol: optional, tolerance before sqrt, double [1 x 1]
%
%  OUTPUTS
%   distMatrix: distance between points, double [nPoints x mPoints]
%
%  SYNTAX
%
%  distMatrix = models.utilities.geomPublic. ...
% euclideanDistanceBetweenTwoSets(set1, set2)
%
% Function euclideanDistanceBetweenTwoSets computes pairwise distances between
% two sets of points defined in _set1_ and _set2_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
% mcode docu
