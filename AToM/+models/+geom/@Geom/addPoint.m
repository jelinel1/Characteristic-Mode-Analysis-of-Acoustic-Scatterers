%% addPoint include Point to Geom
% This method adds a new object Point to object container of class Geom.
% It returns objName of the new object.
%
%  INPUTS
%   obj: Geom object
%   coords: expression for coordinates definition, char [1 x N]/double [1 x 3]
%   name: optional, name of object, char [1 x N]
%
%  OUTPUTS
%   objName: name of new GeomObject, char [1 x N]
%
%  SYNTAX
%
%  objName = obj.addPoint(coords)
%
% The object of type Point with coordinates _coords_ is created in Geom.
%
%  objName = obj.addPoint(coords, name)
%
% The object of type Point with coordinates _coords_ is created in Geom. The
% name of new object is set to _name_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
