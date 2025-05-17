%% solveSMatrixDecomposition run solver for SMatrix decomposition
% This function run custom inner solver in GEP when S matrix is used for
% computing characteristic modes.
%
%  INPUTS
%   objSolver: object of inner solver, struct [1 x 1]
%     .solver: reference to MoM2D, solver [1 x 1]
%     .S: alocation for S matrix, double [0 x 0]
%     .X: alocation for X matrix, double [0 x 0]
%   frequencyList: list of frequencies, double [nFreq x 1]
%   waitBar: waitbar in GEP status window, waitbar [1 x 1]
%
%  OUTPUTS
%   objSolver: object of inner solver, struct [1 x 1]
%     .solver: reference to MoM2D, solver [1 x 1]
%     .S: S matrix, double [maxAlpha x nEdges x nFreq]
%     .X: X matrix, double [nEdges x nEdges x nFreq]
%
%  SYNTAX
%
%  objSolver = solveSMatrixDecomposition(objSolver, frequencyList, waitBar)
%
%  Note:  _objSolver_ is in general named as solver, but here it is struct.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode docu
