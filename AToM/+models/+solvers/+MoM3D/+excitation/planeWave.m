%% excitation vector for MoM3D and a plane wave
% This function evaluates excitation vector for MoM3D and a plane wave
%
%  INPUTS
%   mesh:  mesh structure for VMoM, see
%          models.utilities.meshPublic.getMeshData3D.m
%   basisFunc: basis functions structure,
%              see models.solvers.MoM3D.basisFcns.m
%   planeWaveData.propagationVector [1 x 3]: Direction of propagation
%                                             (real vector)
%   planeWaveData.initElectricField [1 x 3]: Reference vector defining
%                                   electric intensity (complex vector)
%   planeWaveData.axialRatio [1 x 1]: Amplitude ratio in components
%                                   of electric field vector (1,Inf)
%   planeWaveData.direction [string]: 'left' , 'right', direction
%                                   of elliptic polarization
%   k: wavenumber, double [1 x Nk]
%   quadOrder: quadrature order, integer [1 x 1]
%
%  OUTPUTS
%   vVecPW [NBF x Nk]: Excitation vectors (columns)
%                       for all frequency points
%
%  SYNTAX
%   vVecPW = models.solvers.MoM3D.excitation.planeWave ...
%            (mesh, basisFunc, planeWaveData, k, quadOrder)
%
%  EXAMPLE 1 - right elliptically polarized PW propagating
%                   in z-direction having axial ratio 3
%   planeWaveData.propagationVector=[0 0 1];
%   planeWaveData.initElectricField=[1 0 0];
%   planeWaveData.axialRatio=3;
%   planeWaveData.direction='right';
%
%  EXAMPLE 2 - right elliptically polarized PW propagating
%                   in z-direction having axial ratio 3
%   planeWaveData.propagationVector=[0 0 1];
%   planeWaveData.initElectricField=[1 1i/3 0];
%   planeWaveData.axialRatio=Inf;
%   planeWaveData.direction='right';
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2020, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com
