%% prepareResultStruct prepare struct for result
% Create structure for result
%
%  INPUTS
%   description: name of this result, char [1 x N]
%   dimensions: dimensions of this result, char [1 x N]
%   freqDepDim: frequency-dependent dimension, double [1 x 1]
%   units: units of this result, char [1 x N]
%   data: data of this result, double [any]
%
%  OUTPUTS
%   resultStruct: structure of result, struct [1 x 1]
%     .description: description of result, char [1 x N]
%     .data: results data, double [any]
%     .size: size of data, double [1 x N]
%     .dimensions: description of dimensions, char [1 x N]
%     .units: units of data, char, [1 x N]
%     .frequencyDependentDimension: number of frequency-dependent
%                                                 dimension, double [1 x 1]
%
%  SYNTAX
%
%  resultStruct = prepareResultStruct(description, dimensions, ...
%     freqDepDim)
%  resultStruct = prepareResultStruct(description, dimensions, ...
%     freqDepDim, units)
%  resultStruct = prepareResultStruct(description, dimensions, ...
%     freqDepDim, units, data)
%
% If result does not have frequency-dependent dimension, set _freqDepDim_ =
% 0.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode docu
