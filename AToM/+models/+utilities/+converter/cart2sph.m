%% CART2SPH Transforms carthesian coordinates to spherical coordinates
% (x,y,z) -> (r,theta,phi)
%
%  INPUTS
%   x: x coordinate, double [N x 1]
%   y: y coordinate, double [N x 1]
%   z: z coordinate, double [N x 1]
%
%  OUTPUTS
%   r: r coordinate in spherical coordinates, double [N x 1]
%   theta: theta coordinate in spherical coordinates, double [N x 1]
%   phi: phi coordinate in spherical coordinates, double [N x 1]
%
%  SYNTAX
%   [r, theta, phi] = cart2sph(x, y, z)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode
