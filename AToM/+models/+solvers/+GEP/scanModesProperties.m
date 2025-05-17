%% scanModesProperties returns modes properties from given modesTrack
% Return informations about modes from _modesTrack_ matrix
%
%  INPUTS
%   modesTrack: modes tracking matrix, double [nModes x nFreq]
%   gepOptions: options settings, struct [1 x 1]
%
%  OUTPUTS
%   modesProp: output structure, struct [1 x 1]
%     .maxUsedModeNumber: maximal value in modesTrack, double, [1 x 1]
%     .start: indicator where modes start, double [1 x maxUsedModeNumber]
%     .end: indicator where modes end, double [1 x maxUsedModeNumber]
%     .length: length of modes, double [1 x maxUsedModeNumber]
%
%  SYNTAX
%
%  modesProp = scanModesProperties(modesTrack)
%  modesProp = scanModesProperties(modesTrack, gepOptions)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode docu
