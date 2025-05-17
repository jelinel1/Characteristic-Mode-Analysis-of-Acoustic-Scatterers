%% calculates material part of impedance matrix
% This function evaluates material part of impedance matrix in VJIE MoM
% with cartesian basis functions in each tetrahedron.
% NOTES
%   1/ Implementation is based on eye(3) basis functions for each
%      tetrahedra and 1:T ordering within impedance matrix!!
%   2/ MATLAB R2018a and newer needed!
%   3/ Zmat contains part of Xvac, see MOOPEL document
%
% INPUTS:
%    Mesh:       Mesh structure for VMoM, see
%                models.utilities.meshPublic.getMeshData3D.m
%    BF:         Basis functions for VMoM, see
%                models.solvers.MoM3D.basisFcns.getBasisFcns.m
%    k:          wavenumber, double [1 x 1]
%    Material:   Material structure for VMoM, see
%                models.materialsMoM3D.assignMaterial
%
% OUTPUTS:
%    Zmat: material matrix, double [NBF x NBF]
%
% SYNTAX
%
%    Zmat = models.solvers.MoM3D.equations.zMatRho(Mesh, BF, k, Material)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode
