%% deletObject delete object from Geom
% This method removes an object specified by its name name from Geom
% _obj_.
%
%  INPUTS
%   obj: Geom object, [1 x 1]
%   name: object name, char [1 x N]
%   type: optional type of object, char [1 x N]
%
%  OUTPUTS
%   isDeleted: logical [1 x 1]
%
%  SYNTAX
%  isDeleted = obj.deleteObject(name, type)
%
% The object specified by _name_ is removed from Geom object _obj_. If
% _type_ of object is set, the search is performed faster just within objects
% of specified type. Possible types are objects of class GeomObjectType:
% 'Point, 'Line', 'EllipseArc', 'EquationCurve', 'ParallelogramFrame',
% 'PolyLine', 'PolyCurve', 'Parallelogram', 'Ellipse', 'PolyLoop', 'Polygon',
% 'Curve', 'Shape'.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
