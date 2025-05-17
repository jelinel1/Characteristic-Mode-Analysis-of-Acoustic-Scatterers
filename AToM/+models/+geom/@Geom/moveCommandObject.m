%% moveCommandObject move command to new position in history of object
% This method removes a command from history of object's transformations.
%
%  INPUTS
%   obj: Geom object, [1 x 1]
%   name: object name, char [1 x N]
%   oldNum: id of command to be moved, double [1 x 1]
%   newNum: new position of comand in History, double [1 x 1]
%   type: optional type of object, char [1 x N]
%
%  OUTPUTS
%   isMoved: logical [1 x 1]
%
%  SYNTAX
%
%  oldNum = obj.removeCommandObject(name, oldNum, newNum, type)
%
% The command specified by command number _oldNum_ of object specified by _name_
% is moved in object's history to new position specified by _newNum_ }if the
% object is found in Geom object _obj_).After the command is removed,
% the object history is recomputed. If _type_ of object is set, the search is
% performed faster just within objects of specified type. Possible types are
% objects of class GeomObjectType: Point, Line, EllipseArc, EquationCurve,
% ParallelogramFrame, PolyCurve, Parallelogram, Ellipse, PolyLoop,
% Curve, Shape.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
