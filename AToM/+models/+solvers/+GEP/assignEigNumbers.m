%% assignEigNumbers assign eigen-numbers to modes track
% This function assign unsorted eigen-numbers and eigen-vectors to
% track defined in _modesTrack_ and make modes sorted.
%
%  INPUTS
%   eigVec: original eigen vectors, double [nEdges x nModes x nFreq]
%   eigNum: original eigen numbers, double [nModes x nFreq]
%   modesTrack: modes tracking matrix, double [nModes x nFreq]
%   gepOptions: options settings, struct [1 x 1]
%
%  OUTPUTS
%   assignedEigVec: assigned eigen vectors, double
%                                      [nEdges x maxUsedModeNumber x nFreq]
%   assignedEigNum: assigned eigen numbers, double
%                                      [maxUsedModeNumber x nFreq]
%
%  SYNTAX
%
%  [assignedEigVec, assignedEigNum] = ...
%     assignEigNumbers(eigVec, eigNum, modesTrack)
%  [assignedEigVec, assignedEigNum] = ...
%     assignEigNumbers(eigVec, eigNum, modesTrack, gepOptions)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode docu
