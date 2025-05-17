%% getLocalCoordinateSystem get objects local coordinate system
%  This method determines local coordinate system of a polygon.
%
%  INPUTS
%   points: 3D points, double [N x 3]
%
%  OUTPUTS
%   origin: coordinate system origin if interest, double [1 x 3]
%   localX: X axis direction, double [1 x 3]
%   localX: Y axis direction, double [1 x 3]
%   localX: Z axis direction, double [1 x 3]
%
%  SYNTAX
%
%  [origin, localX, localY, localZ] = models.utilities.meshPublic.
%     getLocalCoordinateSystem(points);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
