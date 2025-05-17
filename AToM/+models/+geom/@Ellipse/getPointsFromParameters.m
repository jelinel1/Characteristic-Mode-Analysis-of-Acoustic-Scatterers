%% getPointsFromParameters get points on object
% This function computes position of points specified by parametric value [0, 1]
% on given object.
%
%  INPUTS
%   obj: geometry object
%   params: vector of parametric values, double [N x 2]
%
%  OUTPUTS
%   points: 3D points, double [N x 3]
%
%  SYNTAX
%
%  points = obj.getPointsFromParameters(params)
%
% Position of points on GeomObject _obj_ is computed from their parametric
% specification _params_. Parameters can be from interval [0, 1]. Meaning of
% the first parameter (params(:, 1)): 0 means starting point of the arc
% (startAngle), 1 means ending point of the arc (startAngle + angle); meaning of
% the second parameter (params(:, 2)) is distance between center of Ellipse and
% point on Ellipses arc defined by first parameter.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
