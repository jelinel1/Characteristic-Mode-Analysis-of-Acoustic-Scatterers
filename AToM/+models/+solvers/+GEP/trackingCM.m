%% trackingCM track modes with respect to corrTable
% Track and sort modes according to correlation coefficients in
% correlation table.
%
%  INPUTS
%   eigVec: unsorted eigen-vectors, double [nEdges x nModes x nFreq]
%   eigNum: unsorted eigen-numbers, double [nModes x nFreq]
%   corrInputData: additional data for correlation comp., struct [1 x 1]
%   gepOptions: options settings, struct [1 x 1]
%   corrTable: correlationTable, double [nModes x nModes x nFreq-1]
%
%  OUTPUTS
%   outStruct: output structure, struct [1 x 1]
%     .modesTrack: modes track in unsorted values, double, [nModes x nFreq]
%     .eigNumSorted: sorted eigen numbers, double
%                                               [maxUsedModeNumber x nFreq]
%     .eigVecSorted: sorted eigen vectors, double
%                                      [nEdges x maxUsedModeNumber x nFreq]
%     .corrTable: correlation table, double [nModes x nModes x nFreq-1]
%   corrInputData: additional data for correlation comp., struct [1 x 1]
%
%  SYNTAX
%
%  [outStruct, corrInputData] = trackingCM(eigVec, eigNum)
%  [outStruct, corrInputData] = trackingCM(eigVec, eigNum, ...
%     corrInputData)
%  [outStruct, corrInputData] = trackingCM(eigVec, eigNum, ...
%     corrInputData, gepOptions)
%  [outStruct, corrInputData] = trackingCM(eigVec, eigNum, ...
%     corrInputData, gepOptions, corrTable)
%  [outStruct, corrInputData] = trackingCM(eigVec, eigNum, ...
%     corrInputData, gepOptions, corrTable, statusWindow)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode docu
