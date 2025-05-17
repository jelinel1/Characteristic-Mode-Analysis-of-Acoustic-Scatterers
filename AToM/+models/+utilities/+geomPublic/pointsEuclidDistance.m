%% pointsEuclidDistance computes Euclidean distances between points in 3D
% This function computes distance between individual points and total
% length of the segments connecting all points.
%
%  INPUTS
%   points: 3D points, double [N x 3] in [m]
%
%  OUTPUTS
%   totalLength: length of the whole refracted line, double [1 x 1] in [m]
%   sectionLengths: length of individual segments, double [(N - 1) x 1] in [m]
%
%  SYNTAX
%
%  [totalLength, sectionLengths] = ...
% models.utilities.geomPublic.pointsEuclidDistance(points)
%
% Function pointsEuclidDistance computes Euclidean distances between 3D points.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
