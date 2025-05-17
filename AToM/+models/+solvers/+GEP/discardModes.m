%% discardModes discard modes according to specification
% Discard modes according to settings set by user.
%
%  INPUTS
%   eigVec: eigen vectors, double [nEdges x maxUsedModeNumber x nFreq]
%   eigNum: eigen numbers, double [maxUsedModeNumber x nModes]
%   modesTrack: modes tracking matrix, double [nModes x nFreq]
%   opt: options settings, struct [1 x 1]
%
%  OUTPUTS
%   eigVec: eigen vector, double [nEdges x maxUsedModeNumber* x nFreq]
%   eigNum: eigen numbers, double [maxUsedModeNumber* x nFreq]
%   *: Number of output modes may be different than number of input modes.
%
%  SYNTAX
%
%  [eigVec, eigNum] = discardModes(eigVec, eigNum, modesTrack)
%  [eigVec, eigNum] = discardModes(eigVec, eigNum, modesTrack, gepOptions)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode docu
