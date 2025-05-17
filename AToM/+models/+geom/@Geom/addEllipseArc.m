%% addEllipseArc include EllipseArc to Geom object container
% This method adds a new object EllipseArc to object container of class Geom.
% It returns objName of the new object.
%
%  INPUTS
%   obj: Geom object
%   cP: center point, char [1 x N]/double [1 x 3]
%   majV: major axis vertex point, char [1 x N]/double [1 x 3]
%   minV: minor axis vertex point, char [1 x N]/double [1 x 3]
%   sA: start angle of EllipseArc, char [1 x N]/double [1 x 1]
%   a: angle of EllipseArc, char [1 x N]/double [1 x 1]
%   name: optional, name of object, char [1 x N]
%
%  OUTPUTS
%   objName: name of new GeomObject, char [1 x N]
%
%  SYNTAX
%
%  objName = obj.addEllipseArc(cP, majV, minV, sA, a)
%
% The object of type EllipseArc specified by _cP_, _majV_, _minV, _sA_ and _a_
% is created in Geom.
%
%  objName = obj.addEllipseArc(cP, majV, minV, sA, a, name)
%
% The object of type EllipseArc specified by _cP_, _majV_, _minV, _sA_ and _a_
% is created in Geom. The name of new object is set to _name_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
