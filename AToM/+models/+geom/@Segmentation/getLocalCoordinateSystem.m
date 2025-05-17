%% getLocalCoordinateSystem computes local coordinate system from segments
% This function computes local coordinate system from segmentation.
%
%  INPUTS
%   seg: segments, Segmentation [1 x 1]
%   geomObj: GeomObject of interest, GeomObject [1 x 1]
%   iCell: optional, # of cell wanted
%   tol: optional, geom precision, double [1 x 1], default is tol = 1e-10
%
%  OUTPUTS
%   origin: coordinate system origin if interest, double [1 x 3]
%   localX: X axis direction, double [1 x 3]
%   localX: Y axis direction, double [1 x 3]
%   localX: Z axis direction, double [1 x 3]
%
%  SYNTAX
%
%  [origin, localX, localY, localZ] = segmentation.getLocalCoordinateSystem( ...
% seg, geomObj)
%
% Function getLocalCoordinateSystem computes local coordinate system
% specified by origin point _origin, vectors for axes (_localX_, _localY_ and
% _localY_) from segmentation _seg_ 3D points. The result is rounded to geometry
% precision _tol_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
