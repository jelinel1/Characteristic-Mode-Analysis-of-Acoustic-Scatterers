%% postEigSMatrixDecomposition is used as post-eigs function
% This function is called after eig/eigs when S matrix is used for
% computing characteristic modes and eigen-vectors and eigen-numbers are
% postprocessed here.
%
%  INPUTS
%   eigVec: eigen-vectors, double [nEdges x nModes x nFreq]
%   eigNum: eigen-numbers, double [nModes x nFreq]
%   iFreq: number of frequency sample, double [1 x 1]
%   objGEP: GEP object, GEP [1 x 1]
%   dataFromPreProc: data prom preprocessing function, struct [1 x 1]
%
%  OUTPUTS
%   eigVec: updated eigen-vectors, double [nEdges x nModes x nFreq]
%   eigNum: updated eigen-numbers, double [nModes x nFreq]
%
%  SYNTAX
%
%  [eigVec, eigNum] = postEigSMatrixDecomposition(eigVec, eigNum, ...
%     iFreq, objGEP, dataFromPreproc)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode docu
