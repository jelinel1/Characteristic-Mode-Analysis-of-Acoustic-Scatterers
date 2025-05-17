%% planeWave2sphericalWaves Expansion of planeWave into spherical waves
%
%  Definition of planeWaveData input:
%   planeWaveData.propagationVector [1 x 3]: Direction of propagation
%                                             (real vector)
%   planeWaveData.initElectricField [1 x 3]: Reference vector defining
%                                   electric intensity (complex vector)
%   planeWaveData.axialRatio [1 x 1]: Amplitude ratio in components
%                                   of electric field vector (1,Inf)
%   planeWaveData.direction [string]: 'left' , 'right', direction
%                                   of elliptic polarization
%
%  Expansion coeficients can be used to get excitation vector as
%  vVecPWS = 1 / (sqrt(Z0) * k) * S1' * expansionCoefs
%  where Z0 is free space impedance, k is wavenumber and S1 is S matrix
%  based on regular spherical waves.
%
%  INPUTS
%   planeWaveData:  definition of planeWave, struct [1 x 1]
%   maxDegreeL:     maximal degree of used spherical functions,
%                     double [1 x 1], default value 15
%
%  OUTPUTS
%   expansionCoefs:  vector of expansion coefficients, double [N x 1]
%   indexMatrix: matrix of ordering in S matrix, double [5 x N]
%
%  SYNTAX
%   expansionCoefs = planeWave2sphericalWaves(planeWaveData, maxDegreeL)
%   [expansionCoefs, indexMatrix] = ...
%                    planeWave2sphericalWaves(planeWaveData, maxDegreeL)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode
