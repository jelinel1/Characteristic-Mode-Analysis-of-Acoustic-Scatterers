%% solverSMatrixDecomposition create solver for SMatrix decomposition
% This function create solver when S matrix is used for
% computing characteristic modes.
%
%  INPUTS
%   objGEP: GEP object, GEP [1 x 1]
%
%  OUTPUTS
%   mySolver: structure of my solver, struct [1 x 1]
%    .solver: reference to MoM2D, solver [1 x 1]
%    .S: alocation for S matrix, double [0 x 0]
%    .X: alocation for X matrix, double [0 x 0]
%
%  SYNTAX
%
%  mySolver = solverSMatrixDecomposition(objGEP)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode docu
