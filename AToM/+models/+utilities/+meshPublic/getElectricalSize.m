%% getElectricalSize evaluates electric size of a given mesh
% This function evaluates a measure of electric size of mesh at a given
% frequency and for a given material distribution. The worst case is
% returned.
%
% INPUTS
%  f0: frequency, double [1 x N]
%  mesh: mesh structure for SMoM or VMoM, see
%        models.utilities.meshPublic.getMeshData2D.m or
%        models.utilities.meshPublic.getMeshData3D.m
%  materialStr: material structure for VMoM case, see
%               models.materialsMoM3D.assignMaterial (do not use for SMoM)
%
% OUTPUTS
%  meshElSizeRe: worst case mesh size metric based on real part of wavenumber,
%                double [1 x 1]
%  meshElSizeIm: worst case mesh size metric based on imaginary part of
%                wavenumber, double [1 x 1]
%
% SYNTAX
%
% [meshElSizeRe, meshElSizeIm, worstTetRe, worstTetIm] = ...
%       models.utilities.meshPublic.getElectricalSize(...
%       f0, Mesh, materialStr)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com
% (c) 2021, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
