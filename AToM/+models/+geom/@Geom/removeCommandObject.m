%% removeCommandObject remove command from history of object
% This method removes a command from history of object's transformations.
%
%  INPUTS
%   obj: Geom object, [1 x 1]
%   name: object name, char [1 x N]
%   cmdNum: id of command to be removed, double [1 x 1]
%   type: optional type of object, char [1 x N]
%
%  OUTPUTS
%   isRemoved: logical [1 x 1]
%
%  SYNTAX
%
%  isRemoved = obj.removeCommandObject(name, cmdNum,  type)
%
% The command specified by command number _cmdNum_ of object specified by _name_
% is removed from object's history if the object is found in Geom object _obj_.
% After the command is removed, the object history is recomputed.
% If _type_ of object is set, the search is performed faster just within objects
% of specified type. Possible types are objects of class GeomObjectType:
% 'Point', 'Line', 'EllipseArc', 'EquationCurve', 'ParallelogramFrame',
% 'PolyLine', 'PolyCurve', 'Parallelogram', 'Ellipse', 'PolyLoop', 'Polygon',
% 'Curve', 'Shape'.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
