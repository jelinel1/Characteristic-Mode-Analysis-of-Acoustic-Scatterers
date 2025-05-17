%% arePointsInSamePlane determine if points are in same plane
% This function determines if a set of 3d points is co-planar / all points lie
% in teh same plane.
%
%  INPUTS
%   points: set of points, double [nPoints x 2]
%   tol: optional, geom precision, double [1 x 1]
%
%  OUTPUTS
%   areInSame: are points in same plane, logical [1 x 1]
%   areColinear: are points in one line, logical [1 x 1]
%
%  SYNTAX
%
%  [areInSame, areColinear] = ...
% models.utilities.geomPublic.arePointsInSamePlane(points, tol)
%
% Function arePointsInSamePlane determines if 3D points _points_ lie all in the
% sam plane according to numerical precision _tol_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
