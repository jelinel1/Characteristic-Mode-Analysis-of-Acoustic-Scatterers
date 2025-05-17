%% computeP compute electric moment operator
% Compute electric moment operator
%  If frequency is not set, results corresponds to p0 in
%  p = 1i / (2*pi*frequency) * p0; i.e. to results with
%  frequency = 1i / (2*pi).
%
%  INPUTS
%   mesh: mesh structure, struct [1 x 1]
%   basisFcns: basis functions, struc [1 x 1]
%   frequency: frequency list, double [nFreq x 1]
%
%  OUTPUTS
%   P: electric moment, double [nEdges x nEdges]
%   p: electric moment operator: P = p' * p, double [3 x nEdges]
%
%  SYNTAX
%
%  [P, p] = computeP(mesh, basisFcns)
%  [P, p] = computeP(mesh, basisFcns, frequency)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% (c) 2017, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com
% mcode docu
