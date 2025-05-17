%% addLine include Line to Geom
% This method adds a new object Line to object container of class Geom.
% It returns objName of the new object.
%
%  INPUTS
%   obj: Geom object
%   points: expression for coordinates definition, char [1 x N]/double [2 x 3]
%   name: optional, name of object, char [1 x N]
%
%  OUTPUTS
%   objName: name of new GeomObject, char [1 x N]
%
%  SYNTAX
%
%  objName = obj.addLine(points)
%
% The object of type Line with start and end points specified by _points_ is
% created in Geom.
%
%  objName = obj.addLine(points, name)
%
% The object of type Line with start and end points specified by _points_ is
% created in Geom. The name of new object is set to _name_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
