%% excitation vector for MoM3D and a spherical wave
% This function evaluates excitation vector for MoM3D and a spherical wave
%
%  INPUTS
%   mesh:  mesh structure for VMoM, see
%          models.utilities.meshPublic.getMeshData3D.m
%   basisFunc: basis functions structure,
%              see models.solvers.MoM3D.basisFcns.m
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
%   vVecSW = models.solvers.MoM3D.excitation.sphericalWave ...
%            (mesh, basisFunc, sphericalWaveData, k, quadOrder)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com
