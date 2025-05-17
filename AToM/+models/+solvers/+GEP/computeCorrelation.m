%% computeCorrelation compute correlation of eig vectors
% Compute correlation coefficients between given vectors or between vector
% and matrix.
%
%  INPUTS
%   vec0: eigvector of this Mode at this frequency, double [nMode x 1]
%   VEC1: eigvector of all modes at next frequency, double [nMode x nMode]
%
%  OUTPUTS
%   corrTable: table of correlation between modes, double, [1 x nMode]
%
%  SYNTAX
%
%  corrTable = computeCorrelation(vec0, VEC1)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% (c) 2016, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode docu
