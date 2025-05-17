%% pointsScale scale points according to vector
% This function scales specified points according to vector. The individual
% dimensions of points are multiplied by values from specified vector.
%
%  INPUTS
%   points: points in 3D, double [N x 3] in [m]
%   vect: scaling vector, double [1 x 3]
%   center: optional, cneter of transformation (default [0 0 0]), double [1 x 3]
%
%  OUTPUTS
%   points: transformed points in 3D, double [N x 3] in [m]
%   transformMatrix: double [4 x 4]
%
%  SYNTAX
%
%  [points, transformMatrix] = ...
% models.utilities.geomPublic.pointsScale(points, vect, center)
%
% Points are scaled so that any dimension of values in _points_ is multiplied by
% corresponding value from vector _vect_. The object is moved to _center_ before
% scale operation, and then back after the scale operation.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
