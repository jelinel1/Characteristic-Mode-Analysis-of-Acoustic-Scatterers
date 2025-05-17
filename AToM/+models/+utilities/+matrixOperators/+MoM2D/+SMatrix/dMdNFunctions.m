%% dMdNFunctions calculates derivatives of M and N function
% M and N function are defined in Stratton - Electromagnetic theory
%
%  INPUTS
%   n:                   degree of functions, double [1 x 1],
%                         value integer <0 , Inf>
%   m:                   order of functions, double [1 x 1],
%                         value integer <0 , n>
%   phi:                 phi component of given point coordinates in
%                        spherical coordinate system, double [N x 1]
%   dh21:                derivative of spherical bessel function h of
%                        order 2, double [N x 1]
%                         dh21 = d/domega( h2(kr) )
%   dh22:                derivative of spherical bessel function h of
%                        order 2, double [N x 1]
%                         dh22 = d/domega( 1/(kr) * h2(kr) )
%   dh23:                derivative of spherical bessel function h of
%                        order 2, double [N x 1]
%                         dh23 = d/domega( 1/(kr) * d/dr(r*h2(kr)) )
%   l:                   associated legendre polynomial, doble [N x 1]
%   dl:                  derivative of l, double [N x 1]
%   msl:                 singularity treatement for (m / sin(theta)) * P,
%                         double [N x 1]
%
%  OUTPUTS
%   dMdNout: structure with values of M and N function
%             {:, :, 1} - dM even
%             {:, :, 2} - dM odd
%             {:, :, 3} - dN even
%             {:, :, 4} - dN odd
%
%  SYNTAX
%
%  MNout = MN(n, m, kR, phi, sphericalHankelH2, ...
%              dSphericalHankelH2, l, dl, msl);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode
