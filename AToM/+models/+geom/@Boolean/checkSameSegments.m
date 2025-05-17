%% checkSameSegments finds same segments in two sets of segment
% This method finds same segments (also with opposite direction) and returns
% indeces of the same segments.
%
%  INPUTS
%   curves: curves [N x 1]
%   seg1: start Point, end Point of segments set 1, double [2*nSegments x 3]
%   seg2: start Point, end Point of segments set 2, double [2*nSegments x 3]
%   segType1: type of segments set 1, double [nSegments x 2]
%   segType2: type of segments set 2, double [nSegments x 2]
%   obj1: GeomObject [1 x 1]
%   obj2: GeomObject [1 x 1]
%
%  OUTPUTS
%   same1: indeces of same segments from set 1
%   same2: indeces of same segments from set 2
%
%  SYNTAX
%
%  [same1, same2] = models.geom.boolean.checkSameSegments(seg1, seg2, ...
%    segType1, segType2, obj1, obj2)
%
% Two sets defined by their end points segments (_seg1_, _seg2_) and their types
% (_segType1_, _segType2_) are compared. If same segments according to numerical
% precision defined in Geom (also with opposite direction) are found, their
% indeces _same1_ and _same2_ are given.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
