%% scaleObject scale object from Geom according to vector
% This method scales an object specified by its name saved in Geom.
%
%  INPUTS
%   obj: Geom object, [1 x 1]
%   name: object name, char [1 x N]
%   vect: scaling vector, double [1 x 3]
%   type: optional type of object, char [1 x N]
%   callerName: optional, caller name to control notifications, char [1 x N]
%
%  OUTPUTS
%   isModified: logical [1 x 1]
%
%  SYNTAX
%
%  isModified = obj.scaleObject(name, vect, type, callerName)
%
% The object specified by _name_ is scaled (if found in Geom object _obj_).
% If _type_ of object is set, the search is performed faster just within objects
% of specified type. Possible types are objects of class GeomObjectType:
% 'Point', 'Line', 'EllipseArc', 'EquationCurve', 'ParallelogramFrame',
% 'PolyLine' 'PolyCurve', 'Parallelogram', 'Ellipse', 'PolyLoop', 'Polygon',
% 'Curve', 'Shape'.
% The object is scaled according to vector specified by _vect_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
