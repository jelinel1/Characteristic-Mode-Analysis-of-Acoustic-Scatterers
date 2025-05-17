%% computeCorrTableFF compute correlation using Far-Field computation
% Far-field for each mode is computed and than 2D correlation coefficient
% is stored in _corrTable_.
%
%  INPUTS
%   eigVec: eigvectors, double [nEdges x nModes x nFreq]
%   corrInputData: data for computing correlation, struct [1 x 1]
%     .mesh: required - mesh structure, struct [1 x 1]
%     .basisFcns: required - basis functions, struct [1 x 1]
%     .frequencyList: required - list of frequencies, double [nFreq x 1]
%     .FF: optional - result struct with modal far-fields, struct [1 x 1]
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
%  [corrTable, corrInputData] = computeCorrTableFF(eigVec)
%  [corrTable, corrInputData] = computeCorrTableFF(eigVec, corrInputData)
%  [corrTable, corrInputData] = computeCorrTableFF(eigVec, ...
%     corrInputData, gepOptions)
%  [corrTable, corrInputData] = computeCorrTableFF(eigVec, ...
%     corrInputData, gepOptions, corrTable)
%  [corrTable, corrInputData] = computeCorrTableFF(eigVec, ...
%     corrInputData, gepOptions, corrTable, statusWindow)
%
% If _corrTable_ is given as inputs, new values are computed only on
% positions, where corrTable(:, :, n) is matrix of NaNs.
%
% If _corrInputData_ contains far-fields, new values are computed only on
% positions, where farFields(:, :, iFreq, iMode) is matrix of NaNs.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode docu
