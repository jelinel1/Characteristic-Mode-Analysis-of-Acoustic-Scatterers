%% gep solve Generalized Eigenvalue Problem
% Compute GEP: A eigVec = eigNum B eigVec
%
%  INPUTS
%   A: input matrix, double [nEdges x nEdges]
%   B: input matrix, double [nEdges x nEdges]
%   N: normalized matrix, double [nEdges x nEdges]
%   gepOptions: options settings, struct [1 x 1]
%
% if _N_ is empty or NaN, _B_ is used to normalization
%
%  OUTPUTS
%   eigVec: eigen-vectors, double [nEdges x nModes]
%   eigNum: eigen-numbers, double [nModes x 1]
%   INI: reacted power, double, [nModes x 1]
%
%  SYNTAX
%
%  [eigVec, eigNum, INI] = gep(A, B)
%  [eigVec, eigNum, INI] = gep(A, B, N)
%  [eigVec, eigNum, INI] = gep(A, B, N, gepOptions)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% (c) 2016, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode docu
