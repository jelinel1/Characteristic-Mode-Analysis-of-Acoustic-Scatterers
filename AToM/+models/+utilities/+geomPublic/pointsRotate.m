%% pointsRotate rotate points in 3D around vector by angle
% This static method rotates points by angle around line defined by vector
% either starting at origin O and defined by _vect_ or gooing through two points
% defined in _vect_.
%
%  INPUTS
%   points: points in 3D, double [N x 3]
%   vect: definition of rotation axis, double [1or2 x 3]
%   angle: rotation angle, double [1 x 1] in [rad]
%
%  OUTPUTS
%   points: transformed points in 3D, double [N x 3]
%   transformMatrix: double [4 x 4]
%
%  SYNTAX
%
%  [points, transformMatrix] = ...
% models.utilities.geomPublic.pointsRotate(points, vect, angle)
%
% Object obj is rotated by angle in radians around axis specified by _vect_. If
% _vect_ has one row, the rotation is made around line defined by Origin and
% point saved in _vect_. If _vect_ has two rows, the rotatiuon is made around
% line defined by two points in _vect_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
