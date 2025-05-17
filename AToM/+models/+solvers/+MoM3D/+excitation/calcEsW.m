%% evaluates electric field of a given vector spherical harmonic
% This function evaluates electric field of a given vector spherical
% harmonic
%
%  INPUTS
%   x: x-position, double [N x 1]
%   y: y-position, double [N x 1]
%   z: z-position, double [N x 1]
%   sphericalWaveData.wavesType: type of wave, double [1 x 1]
%              1 - regular waves, spherical Bessel function
%              2 - irregular waves, spherical Neumann function
%              3 - inward waves, spherical Hankel function of first kind
%              4 - outward waves, spherical Hankel function of second kind
%   sphericalWaveData.degreeL: L-order, positive integer [1 x 1]
%   sphericalWaveData.degreeM: M-order, positive integer [1 x 1]
%   sphericalWaveData.sigma: sigma-order, integer (1,2) [1 x 1]
%   sphericalWaveData.tau: tau-order, integer (1,2) [1 x 1]
%   k: wavenumber, double [1 x 1]
%
%  OUTPUTS
%   EsW: electric intensity (Cartesian vector), double [N x 3]
%
%  SYNTAX
%   E = models.solvers.MoM3D.excitation.calcEsW ...
%   (x, y, z, sphericalWaveData, k)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2020, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com
