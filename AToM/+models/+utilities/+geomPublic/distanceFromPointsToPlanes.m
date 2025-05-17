%% distanceFromPointsToPlanes compute distance from points to planes
% This function computes distance between sets of points and planes defined
% in 3D.
%
%  INPUTS
%   points: set of points, double [nPoints x 3]
%   planes: struct [1 x nPlanes]
%         .normal: normal vector, double [1 x 3]
%         .pointIn: point on a plane, double [1 x 3]
%
%  OUTPUTS
%   distMatrix: distance between points, double [nPoints x nPlanes]
%
%  SYNTAX
%
%  distMatrix = models.utilities.geomPublic. ...
% distanceFromPointsToPlanes(points, planes)
%
% Function distanceFromPointsToPlanes computes pairwise distances between
% set of points defined in _points_ and set of planes defined in struct
% _planes_. This struct is formed by planes normal vector (_planes.normal_) and
% a point on the plane (_planes.pointIn_).
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
