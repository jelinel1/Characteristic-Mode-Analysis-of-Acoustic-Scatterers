%% CMatrixSymmetryPlanes compute C matrix for MoM symmetry planes
% Compute C matrix for MoM symmetry planes.
%
%  INPUTS
%   mesh: mesh structure, struct [1 x 1]
%   symmetries: vector of symmetries, double [3 x 1]
%   basisFcns: basis functions, struct [1 x 1]
%
%  OUTPUTS
%   CMat: reduced symmetry matrix, double [nUnknowns x N]
%   eBF: elementary BF markers, logical [nUnknowns x 1]
%
%  SYNTAX
%
%  [CMat, eBF] = CMatrixSymmetryPlanes(mesh, symmetries)
%  [CMat, eBF] = CMatrixSymmetryPlanes(mesh, symmetries, basisFcns)
%
%  symmetries
%   Position:
%    symmetries(1): YZ symmetry plane
%    symmetries(2): XZ symmetry plane
%    symmetries(3): XY symmetry plane
%   Values:
%    1: none
%    2: electric
%    3: magnetic
%
% Included in AToM, info@antennatoolbox.com
% (c) 2020, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode
