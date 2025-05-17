%% pointsGlobal2LocalCoords transform object from global to local coordinates
% This function transforms an object from global coordinate system
% ([1, 0, 0], [0, 1, 0], [0, 0, 1]) to local one {defined by object} _origin_,
% _localX_, _localY_ and _localZ_.
%
%  INPUTS
%   points: 3D points, double [N x 3]
%   origin: object center position, origin of coord system, double [1 x 3]
%   localX: orientation of object's coordinate system X, double [1 x 3]
%   localY: orientation of object's coordinate system Y, double [1 x 3]
%   localZ: orientation of object's coordinate system Y, double [1 x 3]
%   varargin:
%            tolerance: optional, geometry tolerance, double [1 x 1], in [m]
%
%  OUTPUTS
%   points: new position of points, double [N x 1]
%
%  SYNTAX
%
%  points = models.utilities.geomPublic.pointsGlobal2LocalCoords(points,
% origin, localX, localY, localZ, tolerance)
%
% Function pointsGlobal2LocalCoords transforms points from global
% coordinate system to local one defined by three vectors _localX_, _localY_,
% _localZ_ and center point _origin_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
