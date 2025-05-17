%% computeAlpha compute matrix of alpha coefficients
% Coeffieicnet alpha is computed from modal excitation coefficient.
%
%  INPUTS
%   Vi: excitation vectors [nEdges x nFreq]
%   eigVec: eigen vectors [nEdges x nModes x nFreq]
%   eigNum: eigen numbers, double [nModes x nFreq]
%
%  OUTPUTS
%   alpha: alpha coefiffients [nModes x nFreq]
%
%  SYNTAX
%
%  alpha = computeAlpha(Vi, eigVec, eigNum)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode docu
