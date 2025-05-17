%% savePolygons save Polygons from Geom to HDF file
% This method prepares a space in HDF file and saves Polygons from Geom there.
%
%  INPUTS
%   obj: Geom object [1 x 1]
%   objectID: ID of HDF object where Polygons should be saved, H5ML.id [1 x N]
%
%  SYNTAX
%
%  obj.savePolygons(objectID)
%
% All Polygons from Geom (_obj_) are saved to HDF file to object specified by
% _objectID_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Martin Marek, BUT, martin.marek@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
