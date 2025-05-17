%% getPointsOnSegments Generate border points of a complex shape
% This method creates points on a border of a complex shape after
% a Boolean operation.
%
%  INPUTS
%   seg: segmentation points, double [2*nSegs x 3]
%   par: segmentation points param. values, double [2*nSegs x 1]
%   segType: type of segment, Curve #, double [nSegs x 2]
%   obj: Master object of the Boolean operation, GeomObject [1 x 1]
%   centerPoint: origin of the local coordinate system, double [1 x 3]
%   localX: local x-axis dir vector, double [1 x 3]
%   localY: local y-axis dir vector, double [1 x 3]
%   localZ: local z-axis dir vector, double [1 x 3]
%   tol: tolerance of precision, double [1 x 1]
%
%  OUTPUTS
%   points: curve points, char [N x 3]
%
%  SYNTAX
%
%  points = getPointsOnSegments(seg, par, segType, obj, centerPoint, ...
%    localX, localY, localZ, tol)
%
% The Beziere curve points are created from _N_ nodes _p_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
