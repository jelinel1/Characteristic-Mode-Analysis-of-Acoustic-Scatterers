%% functionR radial part of spherical waves
%
%  INPUTS
%   degreeL: vector of degrees L, double [N x 1]
%   kR:      vector of radial coordinates, double [M x 1]
%   p:       type of waves, double [1 x 1]
%              1 - regular waves, z = spherical Bessel function
%              2 - irregular waves, z = spherical Neumann function
%              3 - ingoing waves, z = spherical Hankel function 1
%              4 - outgoing waves, z = spherical Hankel function 2
%
%  OUTPUTS
%   R1:   R1 radial function, complex double [N x M]
%   R2:   R2 radial function, complex double [N x M]
%   R3:   R3 radial function, complex double [N x M]
%   zD:   derivatve of propper spherical bessel function,
%         complex double [N x M]
%
%  SYNTAX
%   [R1, R2, R3, zD] = functionR(degreeL, kR, p)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
