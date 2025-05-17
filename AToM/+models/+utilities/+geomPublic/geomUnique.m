%% geomUnique finds unique rows according to relative tolerance
% This function determines unique rows in set of points.
%
%  INPUTS
%   points: set of points, double [nPoints x 1/2/3]
%   tol: geom relative precision, double [1 x 1]
%
%  OUTPUTS
%   uniquePoints: set of unique points, double [nUniques x 1/2/3]
%
%  SYNTAX
%
%  [uniquePoints, indA, indC] = models.utilities.geomPublic.geomUnique( ...
% points, tol)
%
% Function geomUnique determines unique points _uniquePoints_ from set of
% points _points_. Also index vectors
% _indA_: indices of unique rows in initial set) and
% _indC_: indices of initial points in unique set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
