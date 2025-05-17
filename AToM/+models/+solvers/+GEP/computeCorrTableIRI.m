%% computeCorrTableIRI compute correlation table using surface correlation
% Surface correaltion is used to compute correlation coefficient
%
%  INPUTS
%   eigVec: eigvectors, double [nEdges x nModes x nFreq]
%   corrInputData: data for computing correlation, struct [1 x 1]
%     .R: required - real part of impedance matrix, double
%                                                 [nEdges x nEdges x nFreq]
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
%  [corrTable, corrInputData] = computeCorrTableIRI(eigVec)
%  [corrTable, corrInputData] = computeCorrTableIRI(eigVec, corrInputData)
%  [corrTable, corrInputData] = computeCorrTableIRI(eigVec, ...
%     corrInputData, gepOptions)
%  [corrTable, corrInputData] = computeCorrTableIRI(eigVec, ...
%     corrInputData, gepOptions, corrTable)
%  [corrTable, corrInputData] = computeCorrTableIRI(eigVec, ...
%     corrInputData, gepOptions, corrTable, statusWindow)
%
% If _corrTable_ is given as inputs, new values are computed only on
% positions, where corrTable(:, :, n) is matrix of NaNs.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% (c) 2016, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode docu
