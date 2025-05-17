%% correctData modifies input data
% This function modifies value field of _dataset_ structure depending on
% datatype field of _dataset_ structure.
%
%  INPUTS
%   dataset: dataset properties, struct [1 x 1]
%     .name: name of dataset, char [1 x N]
%     .value: data to fill in dataset
%     .datatype: property of HDF.datatype, datatype [1 x 1]
%     .filetype: HDF filetype of data to save, H5ML.id [1 x 1]
%
%  OUTPUTS
%   dataset: dataset properties, struct [1 x 1]
%     .name: name of dataset, char [1 x N]
%     .value: data to fill in dataset
%     .datatype: property of HDF.datatype, datatype [1 x 1]
%     .filetype: HDF filetype of data to save, H5ML.id [1 x 1]
%
%  SYNTAX
%
%  dataset = correctData(dataset)
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Martin Marek, BUT, martin.marek@antennatoolbox.com
