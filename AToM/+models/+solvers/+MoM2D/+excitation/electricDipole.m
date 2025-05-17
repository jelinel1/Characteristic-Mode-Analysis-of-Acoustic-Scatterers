%% excitation vector for a RWG MoM and a point electric dipole
% This function evaluates excitation vector for a RWG MoM and a point
% electric dipole
%
%  INPUTS
%   dipoleData.r0: position (placement) of a dipole, double [1 x 3]
%   dipoleData.pDip: electric dipole moment, double [1 x 3]
%   k: wavenumber, double [1 x Nk]
%   quadOrder [1 x 1]: quadrature order (integer)
%
%  OUTPUTS
%   vVecPdip [NBF x Nk]: Excitation vectors (columns)
%                        for all frequency points
%
%  SYNTAX
%   vVecPdip = models.solvers.MoM2D.excitation.electricDipole ...
%   (mesh, basisFunc, dipoleData, k, quadOrder)
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com
