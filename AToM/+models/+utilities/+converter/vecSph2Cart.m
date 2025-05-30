%% VECSPH2CART Transforms vector in spherical coordinates to vector in
% Cartesian coordinates
%
%  INPUTS
%   sphVectorR: r component of vector in spherical coordinates,
%     double [N x 1] or [N x M x 1]
%   sphVectorT: theta component of vector in spherical coordinates,
%     double [N x 1] or [N x M x 1]
%   sphVectorP: phi component of vector in spherical coordinates,
%     double [N x 1] or [N x M x 1]
%   theta: theta angle position of this vector, double [N x 1]
%   phi: phi position of this vector, double [N x 1]
%
%  OUTPUTS
%   cartVectorX: x component of vector in Cartesian coordinates,
%     double [N x 1] or [N x M x 1]
%   cartVectorY: x component of vector in Cartesian coordinates,
%     double [N x 1] or [N x M x 1]
%   cartVectorZ: x component of vector in Cartesian coordinates,
%     double [N x 1] or [N x M x 1]
%
%  SYNTAX
%   [cartVectorX, cartVectorY, cartVectorZ] = vecSph2Cart( ...
%      sphVectorR, sphVectorT, sphVectorP, theta, phi)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2020, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode
