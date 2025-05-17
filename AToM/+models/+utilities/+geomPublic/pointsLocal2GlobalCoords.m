%% pointsLocal2GlobalCoords transforms object from local to global coordinates
% This function transforms an object from local coordinate system (defined
% for the object) to global one specified by three vectors globalX, globalY and
% globalZ.
%
%  INPUTS
%   points: 3D points, double [N x 3]
%   origin: object center position, double [1 x 3]
%   globalX: orientation of object in global coordinate system, double [1 x 3]
%   globalY: orientation of object in global coordinate system, double [1 x 3]
%   globalZ: orientation of object in global coordinate system, double [1 x 3]
%   varargin:
%            tolerance: optional, geometry tolerance, double [1 x 1], in [m]
%
%  OUTPUTS
%   points: new position of points, double [N x 1]
%
%  SYNTAX
%
%  points = models.utilities.geomPublic.pointsLocal2GlobalCoords(points,
% origin, globalX, globalY, globalZ)
%
% Function pointsLocal2GlobalCoords transforms points from their local
% coordinate system to global one defined by three vectors _globalX_, _globalY_,
% _globalZ_ and _origin_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
