%% getLocalCoordinateSystem get objects local coordinate system
% This method determines local coordinate system of specified object.
%
%  INPUTS
%   obj: object if interest, GeomObject [1 x 1]
%
%  OUTPUTS
%   origin: coordinate system origin if interest, double [nParts x 3]
%   localX: X axis direction, double [nParts x 3]
%   localX: Y axis direction, double [nParts x 3]
%   localX: Z axis direction, double [nParts x 3]
%
%  SYNTAX
%
%  [origin, localX, localY, localZ] = obj.getLocalCoordinateSystem
%
% Method getLocalCoordinateSystem computes one point (_origin_) and thre vectors
% (_localX_, _localY_, _localZ_) that determines local coordinate system of
% specified object _obj_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
