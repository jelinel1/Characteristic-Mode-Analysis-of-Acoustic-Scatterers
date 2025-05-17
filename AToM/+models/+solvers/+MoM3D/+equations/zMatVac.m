%% Computes the vacuum part of volumetric impedance matrix
% This function evaluates vacuum part of impedance matrix in VJIE MoM with
% cartesian basis functions in each tetrahedron.
% NOTES
%   1/ Implementation is based on eye(3) basis functions for each
%      tetrahedra and 1:T ordering within impedance matrix!!
%   2/ For details of matrix assemblage implementation see MOOPEL document.
%   3/ The last for cycle can be par-fored or performed through blocks of
%      size bigger than one, only small speed-up expected.
%   4/ The majority of the code is spend in evaluation of Gint structure.
%   5/ MATLAB R2018a and newer needed!
%   6/ Zmat contains part of Xvac, see MOOPEL document
%
% INPUTS:
%    Mesh:  Mesh structure for VMoM, see
%           models.utilities.meshPublic.getMeshData3D.m
%    BF:    basis functions structure, see basisFunctions.prepareBas...()
%    k:     wavenumber
%    nQuad: order of numerial quadrature used for integration
%    waitBar: AToM waitbar object
%    verbosity: >= 1 --> report, 0 --> do not report
%    GintStatic (optional): static part of Green's function - evaluation of
%                           this matrix takes considerable amound of time,
%                           therefore if entered by the user, it is used
%                           for an evaluation
%
% OUTPUTS:
%    Zvac:  impedance matrix, double [NxN], symmetrical, N = 3*T,
%            T is the number of tetrahedra
%
% SYNTAX
%
% Zvac = computeZvac(Mesh, BF, k, nQuad, waitBar, verbosity, ...
% GintStatic);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode
%
% TODO: (only the serious ones):
% - calculate only 1/2 of matrix in "triaTriaDynamicGreenQuad" and
%   in triaTriaStaticGreen
% - calculate blocks only to fit it into the memory, check size of memory
