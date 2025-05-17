%% writeContent creates group and datasets in HDF file
% This method creates group named _groupName_ in HDF file at location of last
% HDF identificator stated in _parentIDs_. Method also writes datasets to HDF
% file. If _groupName_ is empty variable, created datasets will be at location
% of last HDF identificator stated in _parentIDs_. If _dataset_ is empty
% variable, only group named _groupName_ will be created. Method returns ID of
% newly created group if needed.
%
%  INPUTS
%   parentIDs: HDF group identificators, H5ML.id [1 x N]
%              N corresponds to number of identificators.
%   groupName: name of new group, char [1 x M]
%   dataset: dataset properties, struct [1 x P]
%     .name: name of dataset, char [1 x Q]
%     .value: data to fill in dataset
%     .datatype: property of HDF.datatype, datatype [1 x 1]
%     .filetype: HDF filetype of data to save, H5ML.id [1 x 1]
%
%  OUPTUTS
%   newGroupID: HDF identificator of newly created group, H5ML.id [1 x 1]
%
%  SYNTAX
%
%  writeContent(~, parentIDs, groupName, dataset)
%
% Method writeHDF will close _newGroupID_ before its end
%
%  newGroupID = writeContent(~, parentIDs, groupName, dataset)
%
% Method writeHDF will return identificator of newly created HDF group
% It can be add to variable _ID_ e.g.:
%
%  ID(end+1) = writeContent(~, parentIDs, groupName, dataset).
%
%  writeContent(~, parentIDs, groupName, [])
%
% Method will create group in HDF file named _groupName_
%
%  writeContent(~, parentIDs, [], dataset)
%
% Method will writes datasets to location stated by last element of _parentIDs_.
%
% _dataset.value_ input arguments must be integer, float, complexFloat or
% cell array of strings.
%
% _dataset.datatype_ is a member of HDFDataType.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Martin Marek, BUT, martin.marek@antennatoolbox.com
