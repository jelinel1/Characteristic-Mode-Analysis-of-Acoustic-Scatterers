%% addPolygon include arbitrary Polygon to Geom
% This method adds a new object Polygon to object container of class Geom.
% It returns objName of the new object.
%
%  INPUTS
%   obj: Geom object
%   points: expression for coordinates definition, char [1 x N]/double [N x 3]
%   name: optional, name of object, char [1 x N]
%
%  OUTPUTS
%   objName: name of new GeomObject, char [1 x N]
%
%  SYNTAX
%
%  objName = obj.addPolygon(points)
%
% The object of type Polygon with start defined as first row of _points_ and
% end in last row of _points_ is created in Geom. If first point and last point
% are not the same, the first point is copied to the end of points to form
% closed Polygon.
%
%  objName = obj.addPolygon(points, name)
%
% The name of new object is set to _name_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
