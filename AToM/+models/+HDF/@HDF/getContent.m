%% getContent returns content of HDF file
% This method searches through HDF file and fills _output_ struct with data
% found in file. The function recursively calls itself if unexplored group is
% present. Data from HDF file are produced by struct _content_ obtained by
% h5info high-level HDF function.
%
%  INPUTS
%   content: struct containing HDF file content obtained by h5info.
%   absolutePath: complete path in HDF file, char [1 x N]
%   relativePath: path relative to last call of _getContent_, char [1 x M]
%   output: struct containing achieved data
%
%  OUTPUTS
%   output: struct containing achieved data
%
%  SYNTAX
%
%  output = getContent(HDFobj, content, absolutePath, relativePath, output)
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Martin Marek, BUT, martin.marek@antennatoolbox.com
