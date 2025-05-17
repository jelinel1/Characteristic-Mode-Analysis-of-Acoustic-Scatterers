%% This function evaluates excitation vector for a 1D-rooftop MoM and a plane wave
%
%  INPUTS
%   quadOrder [1 x 1]: quadrature order (integer)
%   planeWaveData.propagationVector [1 x 3]: Direction of propagation
%                                             (real vector)
%   planeWaveData.initElectricField [1 x 3]: Reference vector defining
%                                   electric intensity (complex vector)
%   planeWaveData.axialRatio [1 x 1]: Amplitude ratio in components
%                                   of electric field vector (1,Inf)
%   planeWaveData.direction [string]: 'left' , 'right', direction
%                                   of elliptic polarization
%   k [1 x N_k]: wavenumber
%
%  OUTPUTS
%   vVecPW [N_BF x N_k]: Excitation vectors (columns)
%                       for all frequency points
%
%  SYNTAX
%   vVecPW = planeWave(Mesh, BasisFunc, planeWaveData, k, quadOrder)
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
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com
