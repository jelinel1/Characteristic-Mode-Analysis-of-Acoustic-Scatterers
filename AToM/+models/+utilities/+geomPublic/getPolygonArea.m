%% getPolygonArea compute area of 2D polygon in 3D
% This function computes area of a 2d polzgon (flat) in 3d space.
%
%  INPUTS
%   points: 3D polygon nodes, double [N x 3]
%
%  OUTPUTS
%   area: area of polygon, double [1 x 3] in [rad]
%
%  SYNTAX
%
%  [area, inLine, normal] = models.utilities.geomPublic.getPolygonArea(points)
%
% Function getPolygonArea computes area of polygon defined in 3D space by points
% specified in _points_. In case all the polygon segments specified by _points_
% are parallel, _inLine_ is set to true and area contains NaN.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
