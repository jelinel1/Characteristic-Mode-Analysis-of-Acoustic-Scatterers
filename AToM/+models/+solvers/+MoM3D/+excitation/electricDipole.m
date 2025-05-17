%% This function evaluates excitation vector for MoM3D and a dipole
% This function evaluates excitation vector for MoM3D and a point
% electric dipole
%
%  INPUTS
%   mesh:  mesh structure for VMoM, see
%          models.utilities.meshPublic.getMeshData3D.m
%   basisFunc: basis functions structure,
%               see models.solvers.MoM3D.basisFcns.m
%   dipoleData.r0: position (placement) of a dipole, double [1 x 3]
%   dipoleData.pDip: electric dipole moment, double [1 x 3]
%   k: wavenumber, double [1 x Nk]
%   quadOrder: quadrature order, integer [1 x 1]
