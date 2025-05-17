%% getPointsFromParameters get points on object
% This function computes position of points specified by parametric value [0, 1]
% on given object.
%
%  INPUTS
%   obj: geometry object
%   params: vactor of parametric values, double [N x 1]
%
%  OUTPUTS
%   points: 3D points, double [N x 3]
%
%  SYNTAX
%
%  points = obj.getPointsFromParameters(params)
%
% Position of points on GeomObject _obj_ is computed from their parametric
% specification _params_. Parameters can be from interval [0, 1]: 0 means
% starting point of the arc (startAngle), 1 means ending point of the arc
% (startAngle + angle).
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
