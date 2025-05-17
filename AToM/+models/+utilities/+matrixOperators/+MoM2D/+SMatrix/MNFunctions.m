%% MNFunctions calculates M and N function
% M and N function are defined in Stratton - Electromagnetic theory
%
%  INPUTS
%   n:                   degree of functions, double [1 x 1],
%                         value integer <0 , Inf>
%   m:                   order of functions, double [1 x 1],
%                         value integer <0 , n>
%   kR:                  wave number multiplied by radius, double [N x 1]
%   phi:                 phi component of given point coordinates in
%                        spherical coordinate system, double [N x 1]
%   sphericalHankelH2:   spherical bessel function h of order 2,
%                         double [N x 1]
%   dSphericalHankelHw:  derivative of spherical bessel function h of
%                        order 2, double [N x 1]
%   l:                   associated legendre polynomial, doble [N x 1]
%   dl:                  derivative of l, double [N x 1]
%   msl:                 singularity treatement for (m / sin(theta)) * P,
%                         double [N x 1]
%
%  OUTPUTS
%   MNout: structure with values of M and N function
%          {:, :, 1} - M even
%          {:, :, 2} - M odd
%          {:, :, 3} - N even
%          {:, :, 4} - N odd
%
%  SYNTAX
%
%  MNout = MN(n, m, kR, phi, sphericalHankelH2, ...
%              dSphericalHankelH2, l, dl, msl);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode
