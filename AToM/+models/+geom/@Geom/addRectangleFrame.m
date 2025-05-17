%% addRectangleFrame include ParallelogramFrame of rectangle shape to Geom
% This method adds a new object ParallelogramFrame to object container
% of class Geom. It returns objName of the new object.
%
%  INPUTS
%   obj: Geom object
%   center: rectangle's center point, char [1 x N]/double [1 x 3]
%   width: rectangle's width, char [1 x N]/double [1 x 3]
%   height: rectangle's height, char [1 x N]/double [1 x 3]
%   normal: optional, rectangle's normal spec. (default 'z'), char [1 x 1]
%   name: optional, name of object, char [1 x N]
%
%  OUTPUTS
%   objName: name of new GeomObject, char [1 x N]
%
%  SYNTAX
%
%  objName = obj.addRectangleFrame(center, width, height)
%
% The object of type ParallelogramFrame specified by center point _center_,
% _width_ and _height_ is created in Geom.
%
%  objName = obj.addRectangleFrame(center, width, height, normal)
%
% The object of type ParallelogramFrame specified by center point _center_,
% _width_, _height_ and normal direction _norm_ is created in Geom.
%
%  objName = obj.addRectangleFrame(center, width, height, normal, name)
%
% The object name is set to _name_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
