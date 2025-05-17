%% areLinesInObject determine if lines lie inside of an object
% This method determines if 3D lines lie inside or outside of specified object.
%
%  INPUTS
%   obj: object if interest, GeomObject [1 x 1]
%   lines: 3D lines, struct [1 x nLines]
%         .startPoint: start points, double [nLines x 3]
%         .endPoint: end point, double [nLines x 3]
%   isDivided: default false, are Segments of obj divided, logical [1 x 1]
%
%  OUTPUTS
%   areIn: are lines inside object, logical [nP x 1]
%   isOnBorder: are lines on object's border, logical [nP x 1]
%
%  SYNTAX
%
%  [areIn, isOnBorder] = obj.areLinesInObject(lines)
%
% Method areLinesInObject determines if lines specified by a struct _lines_ lie
% totaly inside or outside the GeomObject _obj_. The line is defined by a struct
% with properties: lines.startPoint and .endPoint.
%
%  [areIn, isOnBorder] = obj.areLinesInObject(lines, isDivided)
%
% If _isDivided_ set to true, the object contour segments are divided, if line's
% end point is on it. If _isDivided_ set to false, the contour is noy changed.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
