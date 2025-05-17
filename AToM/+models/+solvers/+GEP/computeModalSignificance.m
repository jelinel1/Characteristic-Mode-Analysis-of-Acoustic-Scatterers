%% computeModalSignificance compute matrix of modal significance factors
% Modal significance factor is computed as abs(1/(1 + 1i*lambda))
%
%  INPUTS
%   eigNum: eigen numbers, double [nModes x nFreq]
%
%  OUTPUTS
%   modalS: modal significance factors [nModes x nFreq]
%
%  SYNTAX
%
%  modalS = computeModalSignificance(eigNum)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode docu
