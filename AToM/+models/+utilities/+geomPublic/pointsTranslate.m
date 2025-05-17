%% pointsTranslate translates object according to vector
% This function translates specified points by vector in meters.
%
%  INPUTS
%   points: points in 3D, double [N x 3] in [m]
%   vect: translation vector, double [1 x 3] in [m]
%
%  OUTPUTS
%   points: transformed points in 3D, double [N x 3] in [m]
%   transformMatrix: double [4 x 4]
%
%  SYNTAX
%
%  [points, transformMatrix] = ...
% models.utilities.geomPublic.pointsTranslate(points, vect)
%
% Points are translated to new position according to vector _vect_ in meters.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
