%% savePolyLines save PolyLines from Geom to HDF file
% This method prepares a space in HDF file and saves PolyLines from Geom there.
%
%  INPUTS
%   obj: Geom object [1 x 1]
%   objectID: ID of HDF object where PolyLines should be saved, H5ML.id [1 x N]
%
%  SYNTAX
%
%  obj.savePolyLines(objectID)
%
% All PolyLines from Geom (_obj_) are saved to HDF file to object specified by
% _objectID_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Martin Marek, BUT, martin.marek@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
