%% renameObject rename object in Geom
% This method renames an object specified by its name _oldName_ from Geom _obj_.
%
%  INPUTS
%   obj: Geom object, [1 x 1]
%   oldNname: current object name, char [1 x N]
%   newNname: new name specified by user, char [1 x N]
%   type: optional type of object, char [1 x N]
%
%  OUTPUTS
%   isRenamed: logical [1 x 1]
%
%  SYNTAX
%
%  isRenamed = renameObject(obj, oldName, newName, type)
%
% The object specified by _oldName_ is removed from Geom object _obj_. If
% _type_ of object is set, the search is performed faster just within objects
% of specified type. Possible types are objects of class GeomObjectType:
% 'Point', 'Line', 'EllipseArc', 'EquationCurve', 'ParallelogramFrame',
% 'PolyLine', 'PolyCurve', 'Parallelogram', 'Ellipse', 'PolyLoop', 'Polygon',
% 'Curve', 'Shape'. The object is now named using name specified by user
% _newName_. If _newName_ is allready used in Geom, user is asked to set
% different name.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
