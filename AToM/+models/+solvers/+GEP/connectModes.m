%% connectModes connect interupted modes
% Try to connect modes with previously closed modes.
%
%  INPUTS
%   eigVec: eigvectors, double [nEdges x nModes x nFreq]
%   modesTrack: modes tracking matrix, double [nModes x nFreq]
%   gepOptions: options settings, struct [1 x 1]
%
%  OUTPUTS
%   modesTrack: modes tracks with connections, double [nModes x nFreq]
%
%  SYNTAX
%
%  modesTrack = connectModes(eigVec, modesTrack)
%  modesTrack = connectModes(eigVec, modesTrack, gepOptions)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode docu
