%% loadGeomObject writes properties to geometry class
% This method writes properties common for all GeomObjects to geometry class
% loaded from HDF file.
%
%  INPUTS
%   temp1: struct containing geometry objects properties, struct [1 x N]
%   iObj: increment identificator, double [1 x 1]
%   groupName: defines which geometry object type is now saved, char [1 x N]
%
%  SYNTAX
%
%  loadGeomObject(geometry, temp1, iObj, groupName)
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
