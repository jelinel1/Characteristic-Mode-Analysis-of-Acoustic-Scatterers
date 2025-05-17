%% deleteContent deletes whole content of HDF group
% This method deletes group in HDF file stated at the end of targetPath.
% New group with the same name is created. This group is then empty.
% _targetPath_ must be comprehend as path.
%
%  INPUTS
%   targetPath: sequence of group names to delete last one, char [1 x N],
%
%
%  SYNTAX
%
%  deleteContent(obj, targetPath)
%
% Default syntax, all input arguments must be set.
%
%  deleteContent(obj, [])
%
% deletes whole content of HDF file, only project group remains
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Martin Marek, BUT, martin.marek@antennatoolbox.com
