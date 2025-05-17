%% distanceFromPointsToLines compute distance from points to lines
% This function computes perpendicular distance between sets of points and lines
% defined by two points in 3D.
%
%  INPUTS
%   points: set of points, double [nPoints x 3]
%   lines: struct [1 x nLines]
%         .startPoint: start points, double [nLines x 3]
%         .endPoint: end point, double [nLines x 3]
%
%  OUTPUTS
%   distMatrix: distance from Points to Lines, double [nPoints x nLines]
%   parameters: parametric projection of P. to L., double [nPoints x nLines]
%
%  SYNTAX
%
%  [distMatrix, parameters] = models.utilities.geomPublic. ...
% distanceFromPointsToLines(points, lines)
%
% Function distanceFromPointsToLines computes pairwise distances between
% set of points defined in _points_ and set of lines defined in struct
% _lines_. This struct is formed by two points (_lines.startPoint_ and
% _lines.endPoint_).
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
