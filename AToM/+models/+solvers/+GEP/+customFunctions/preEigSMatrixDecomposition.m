%% preEigSMatrixDecomposition is used as pre-eigs function
% This function is called before eig/eigs when S matrix is used for
% computing characteristic modes and input matrices are pre-processed here.
%
%  INPUTS
%   data: input matrices, struct [1 x 1]
%     .A: input matrix, double [nEdges x nEdges]
%     .B: input matrix, double [nEdges x nEdges]
%     .N: normalized matrix, double [nEdges x nEdges]
%   iFreq: number of frequency sample, double [1 x 1]
%   objGEP: GEP object, GEP [1 x 1]
%
%  OUTPUTS
%   data: updated input matrices, struct [1 x 1]
%     .A: input matrix, double [nEdges x nEdges]
%     .B: input matrix, double [nEdges x nEdges]
%     .N: normalized matrix, double [nEdges x nEdges]
%   dataForPostproc: data prom preprocessing function, struct [1 x 1]
%
%  SYNTAX
%
%  [data, dataForPostproc] = preEigSMatrixDecomposition(data, iFreq, ...
%     objGEP)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode docu
