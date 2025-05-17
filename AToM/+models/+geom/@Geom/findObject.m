%% findObject find object in geom by name
% This method founds object stored in Geom using objects name. If _type_ is
% specified, only objects of selected type are searched (Points, Curves or
% Shapes). If _type_ is not specified, all objects are researched.
%
%  INPUTS
%   obj: Geom object
%   name: name of searched object, char [1 x N]
%   type: object type specifier, GeomObjectType [1 x 1]
%
%  OUTPUTS
%   foundObj: found object ID, GeomObject [1 x 1]
%
%  SYNTAX
%
%  foundObj = obj.findObject(name)
%
% The object with name _name_ is searched in the whole Geom object _obj_. Found
% object is stored in _foundObj_.
%
%  foundObj = obj.findObject(name, type)
%
% The object with name _name_ is searched in the Geom object _obj_. Only objects
% of specified _type_ (models.geom.GeomObjectType.Point, ... 'Curve', 'Shape')
% are searched.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
