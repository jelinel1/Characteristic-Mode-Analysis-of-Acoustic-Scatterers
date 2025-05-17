%% checkSamePoints determine if points are same according to tolerance
% This function determines if points are same (distance lower than tolerance)
% and replaces points with same entries.
%
%  INPUTS
%   points: set of points, double [nPoints x 2/3]
%   tolernace: geom precision, double [1 x 1]
%
%  OUTPUTS
%   checkedPoints: points rounded to tolerance, doble [nPoints x 2/3]
%
%  SYNTAX
%
%  checkedPoints = models.utilities.geomPublic.checkSamePoints( ...
% points, tolerance)
%
% Function checkSamePoints determines if 2D points _points_ have smae points,
% that are closer than tolernace. In that case, points are rplaced bz the
% first occurance.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode docu
