%% SPH2CART Transforms spherical coordinates to carthesian coordinates
% (r, theta, phi) -> (x, y, z)
%
%  INPUTS
%   r: r coordinate in spherical coordinates, double [N x 1]
%   theta: theta coordinate in spherical coordinates, double [N x 1]
%   phi: phi coordinate in spherical coordinates, double [N x 1]
%
%  OUTPUTS
%   x: x coordinate, double [N x 1]
%   y: y coordinate, double [N x 1]
%   z: z coordinate, double [N x 1]
%
%  SYNTAX
%   [x, y, z] = sph2cart(r, theta, phi)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode
