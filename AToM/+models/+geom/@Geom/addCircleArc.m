%% addCircleArc include EllipseArc of circular shape to Geom
% This method adds a new object EllipseArc to object container of class Geom.
% It returns objName of the new object.
%
%  INPUTS
%   obj: Geom object
%   center: circle's center point, char [1 x N]/double [1 x 3]
%   radius: circle's radius, char [1 x N]/double [1 x 3]
%   normal: optional, circle's normal spec. (default 'z'), char [1 x 1]
%   name: optional, name of object, char [1 x N]
%
%  OUTPUTS
%   objName: name of new GeomObject, char [1 x N]
%
%  SYNTAX
%
%  objName = obj.addCircleArc(center, radius)
%
% The object of type EllipseArc specified by center point _center_ and _radius_
% is created in Geom.
%
%  objName = obj.addCircleArc(center, radius, normal)
%
% The object of type EllipseArc specified by center point _center_, _radius_ and
% normal direction _norm_ is created in Geom.
%
%  id = obj.addCircleArc(center, radius, normal, name)
%
% The object name is set to _name_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
