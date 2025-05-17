%% excitation vector for a RWG MoM and a spherical wave
% This function evaluates excitation vector for a RWG MoM and a spherical
% wave
%
%  INPUTS
%   sphericalWaveData.wavesType: type of wave, double [1 x 1]
%              1 - regular waves, spherical Bessel function
%              2 - irregular waves, spherical Neumann function
%              3 - inward waves, spherical Hankel function of first kind
%              4 - outward waves, spherical Hankel function of second kind
%   sphericalWaveData.degreeL: L-order, positive integer [1 x 1]
%   sphericalWaveData.degreeM: M-order, positive integer [1 x 1]
%   sphericalWaveData.sigma: sigma-order, integer (1,2) [1 x 1]
%   sphericalWaveData.tau: tau-order, integer (1,2) [1 x 1]
%   k: wavenumber, double [1 x Nk]
%   quadOrder [1 x 1]: quadrature order (integer)
%
%  OUTPUTS
%   vVecSW [NBF x Nk]: Excitation vectors (columns)
%                       for all frequency points
%
%  SYNTAX
%   vVecSW = models.solvers.MoM2D.excitation.sphericalWave ...
%            (mesh, basisFunc, sphericalWaveData, k, quadOrder)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com
