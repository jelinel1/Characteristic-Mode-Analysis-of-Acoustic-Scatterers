%% symmetryCheck check if geometry has given symmetry
% Check if geometry has given symmetry.
%
%  INPUTS
%   mesh: mesh structure, struct [1 x 1]
%   basisFcns: basis functions, struct [1 x 1]
%   T: symmetry transform matrix, double [3 x 3]
%
%  OUTPUTS
%   isSymmetric: detection if structure is symmetric, logical [1 x 1]
%   C: symmetry matrix, double [nUnknowns x nUnknowns]
%   parityMatrix: parity matrix, double [nUnknowns x nUnknowns]
%
%  SYNTAX
%
%  [isSymmetric, C, parityMatrix] = symmetryCheck(mesh, basisFcns, T)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode
