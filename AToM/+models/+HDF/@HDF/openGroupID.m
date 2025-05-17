%% openGroupID returns HDF group identificators
% This method opens sequence of groups named in _targetPath_ in HDF file
% and return HDF group identificators as _groupIDs_. First identificator in
% _groupIDs_ is identificator of project group.
%
%  INPUTS
%   targetPath: sequence of group names to open, char [1 x N],
%
%  OUTPUTS
%   groupIDs: HDF group identificators, H5ML.id [1 x N]
%        N corresponds to number of identificators.
%
%  SYNTAX
%
%  groupIDs = openGroupID(obj, targetPath)
%
% Default syntax, all input arguments must be set.
%
%  groupIDs = openGroupID(obj, [])
%
% _groupIDs_ contains only identificator of project group.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Martin Marek, BUT, martin.marek@antennatoolbox.com
