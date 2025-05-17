%% glob2loc transform points to original plane.
%
%  INPUTS
%   points: 3D points, double [N x 3]
%   centerPoint: object center position, double [1 x 3]
%   localX: orientation of object's coordinate system, double [1 x 3]
%   localY: orientation of object's coordinate system, double [1 x 3]
%   localZ: orientation of object's global coordinate system, double [1 x 3]
%
%  OUTPUTS
%   oldPoints: transformed points, double [N x 3]
%
%
%  SYNTAX
%
%   newPoints = obj.glob2loc(points, centerPoint, globalX, globalY, globalZ)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU, martin.strambach@antennatoolbox.com
