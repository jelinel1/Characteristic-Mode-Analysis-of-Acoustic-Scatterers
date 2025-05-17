%% pointsRotateX rotate points around X-axis by angle
% This function rotates points by angle in rad around global X-axis [1, 0, 0].
%
%  INPUTS
%   points: points in 3D, double [N x 3] in [m]
%   angle: rotation angle, double [1 x 1] in [rad]
%
%  OUTPUTS
%   points: transformed points in 3D, double [N x 3] in [m]
%   transformMatrix: double [4 x 4]
%
%  SYNTAX
%
%  [points, transformMatrix] = ...
% models.utilities.geomPublic.pointsRotateX(points, angle)
%
% Points are rotated by angle in radians around X-axis [1, 0, 0].
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
