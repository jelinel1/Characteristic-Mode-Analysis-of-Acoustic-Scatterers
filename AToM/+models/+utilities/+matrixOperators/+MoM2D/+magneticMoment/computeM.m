%% computeM compute magnetic moment operator
% Compute magnetic moment operator
%
%  INPUTS
%   mesh: mesh structure, struct [1 x 1]
%   basisFcns: basis functions, struc [1 x 1]
%
%  OUTPUTS
%   M: magnetic moment, double [nEdges x nEdges]
%   m: magnetic moment operator: M = m' * m, double [3 x nEdges]
%
%  SYNTAX
%
%  [M, m] = computeM(mesh, basisFcns)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% (c) 2017, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com
% mcode docu
