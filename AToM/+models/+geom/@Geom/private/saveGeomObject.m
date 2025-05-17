%% saveGeomObject prepares properties common for all GeomObjects to HDF file
% This method prepares properties common for all GeomObjects to variable
% _dataset_ which is then saved to HDF file.
%
%  INPUTS
%   geomObj: Point/Line/Ellipse..., GeomObject [1 x 1]
%   nObj: number of objects to save, double [1 x 1]
%   filetypeID: struct containing HDF filetype identificators, struct [1 x N]
%     .float: filetype for float datasets, H5ML.id
%     .integer: filetype for integer datasets, H5ML.id
%     .string: filetype for string datasets, H5ML.id
%   groupName: defines which geometry object type is now saved, char [1 x N]
%
%  OUPTUTS
%   dataset: dataset properties, struct [1 x N]
%     .name: name of dataset, char [1 x N]
%     .value: data to fill in dataset
%     .datatype: datatype of data, char [1 x N]
%     .filetype: HDF filetype of data to save, H5ML.id
%
%  SYNTAX
%
%  saveGeomObject(geomObj, nObj, filetypeID, groupName)
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
