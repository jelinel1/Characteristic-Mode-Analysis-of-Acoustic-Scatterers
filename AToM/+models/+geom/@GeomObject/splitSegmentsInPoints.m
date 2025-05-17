%% splitSegmentsInPoints divide segments in specified points
% This method divides segments oif GeomObject in points specified by user.
%
%  INPUTS
%   obj: object if interest, GeomObject [1 x 1]
%   points: points to be divided in, double [nPoints x 3]
%
%  OUTPUTS
%   isUsed: is Point used for splitting, logical [nPoints x 1]
%
%  SYNTAX
%
%  isUsed = obj.splitSegmentsInPoints(points)
%
% Method splitSegmentsInPoints divides segments of specified GeomObject _obj_
% in user defined _points_. If the point is used is indicated in ouput var
% _isUsed_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
