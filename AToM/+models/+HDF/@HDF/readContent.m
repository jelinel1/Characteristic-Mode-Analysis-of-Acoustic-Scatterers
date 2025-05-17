%% readContent prepares input arguments for getContent
% This method prepares input arguments for getContent. _content_, _absolutePath_
% and _relativePath_ is prepared. _content_ means content of HDF file achieved
% via h5info function. _absolutePath_ is composed from project group name and
% _targetPath_. _relativePath_ is provisionally emtpy variable.
%
%  INPUTS
%   targetPath: path to read, char [1 x N]
%
%  OUTPUTS
%   output: struct containing achieved data
%
%  SYNTAX
%
%  output = readContent(HDFobj, targetPath)
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Martin Marek, BUT, martin.marek@antennatoolbox.com
