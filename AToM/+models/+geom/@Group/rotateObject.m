%% rotateObject rotate all objects in Group
% This method rotates all objects from GroupObject.
%
%  INPUTS
%   obj: Group object
%   groupName: name of GroupObject, char [1 x N]
%   vect: rotation vector, double [1/2 x 3]
%   angle: angle in rad, double [1 x 1]
%
%  SYNTAX
%
%  obj.rotateObject(groupName, vect, angle)
%
% The objects in group _groupName_ are rotated about _angle_ around line
% spoecified by _vect_. If _vect_ has size [1 x 3], the line is specified by
% Origin of coordinates and the point specified in _vect_. If _vect_ has size
% [2 x 3], line is specified by those two points in _vect_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
