%% computeBeta compute matrix of beta coefficients
% Coefficient betta is computed from alpha coefficient
%
%  INPUTS
%   Vi: excitation vectors, double [nEdges x nFreq]
%   eigVec: eigen vectors, double [nEdges x nModes x nFreq]
%   eigNum: eigen numbers, double [nModes x nFreq]
%
%  OUTPUTS
%   beta: beta coefficients, double [nModes x nModes x nFreq]
%
%  SYNTAX
%
%  beta = computeBeta(Vi, eigVec, eigNum)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode docu
