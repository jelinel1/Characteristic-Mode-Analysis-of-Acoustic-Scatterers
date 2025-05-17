%% computeModalExcitation compute matrix of modal excitation factors
% Modal Excitation coeeficients are computed as
%
%  INPUTS
%   Vi: excitation vectors [nEdges x nFreq]
%   eigVec: eigen vectors [nEdges x nModes x nFreq]
%
%  OUTPUTS
%   modalE: modal excitation factors [nModes x nModes x nFreq]
%
%  SYNTAX
%
%  modalE = computeModalExcitation(Vi, eigVec)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode docu
