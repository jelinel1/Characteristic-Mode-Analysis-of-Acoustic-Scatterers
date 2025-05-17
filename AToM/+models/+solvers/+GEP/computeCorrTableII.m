%% computeCorrTableII compute correlation between eigen-vectors
% Correaltion coefficient is computed as correlation between two eigen-
% vectors on next frequency sample.
%
%  INPUTS
%   eigVec: eigvectors, double [nEdges x nModes x nFreq]
%   corrInputData: data for computing correlation, struct [1 x 1]
%   gepOptions: options settings, struct [1 x 1]
%   corrTable: correlation table, double [nModes x nModes x nFreq-1]
%   statusWindow: status window for GUI, GEP status window [1 x 1]
%
%  OUTPUTS
%   corrTable: correlation coeficients, double [nModes x nModes x nFreq-1]
%   corrInputData: data for computing correlation, struct [1 x 1]
%
%  SYNTAX
%
%  [corrTable, corrInputData] = computeCorrTableII(eigVec)
%  [corrTable, corrInputData] = computeCorrTableII(eigVec, corrInputData)
%  [corrTable, corrInputData] = computeCorrTableII(eigVec, ...
%     corrInputData, gepOptions)
%  [corrTable, corrInputData] = computeCorrTableII(eigVec, ...
%     corrInputData, gepOptions, corrTable)
%  [corrTable, corrInputData] = computeCorrTableII(eigVec, ...
%     corrInputData, gepOptions, corrTable, statusWindow)
%
% If _corrTable_ is given as inputs, new values are computed only on
% positions, where corrTable(:, :, n) is matrix of NaNs.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% (c) 2016, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode docu
