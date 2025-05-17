%% findIntersections finds intersection points of two objects
% This method searches for intersection points of two objects and updates their
% segment datat strictire.
%
%  INPUTS
%   obj1: GeomObject 1, GeomObject [1 x 1]
%   obj2: GeomObject 2, GeomObject [1 x 1]
%   samePlanes: part # in same planes, double [nSame x 2]
%
%  OUTPUTS
%   seg1: segments of object 1, double [nS1*2 x 3]
%   seg2: segments of object 2, double [nS2*2 x 3]
%   par1: parametric interpretation of segments, double [nS1*2 x 1]
%   par2: parametric interpretation of segments, double [nS2*2 x 1]
%   typ1: type of segments for object 1, double [nS1 x 2]
%   typ2: type of segments for object 2, double [nS2 x 2]
%   hol1: hole segments identifier for object 1, double [nS1 x 2]
%   hol2: hole segments identifier for object 2, double [nS2 x 2]
%   nSeg1: numer of obj1 segment parts, double [1 x 1]
%   nSeg2: numer of obj2 segment parts, double [1 x 1]
%   sON1: old segment nums of obj 1, double [1 x nNewS1]
%   sON2: old segment nums of obj 2, double [1 x nNewS2]
%   nAdded1: number of segments added for obj 1, double [1 x 1]
%   nAdded2: number of segments added for obj 2, double [1 x 1]
%   isAnyInter: is any intersection?, logical [nS1 x nS2]
%
%  SYNTAX
%
%  [seg1, seg2, par1, par2, typ1, typ2, hol1, hol2, nSeg1, nSeg2, ...
%    sON1, sON2, nAdded1, nAdded2, isAnyInter] = findIntersections(obj1, obj2)
%
% Objects specified by _obj1_ and _obj2_ are checked for intersections. Segment
% parameters are updated if the segment contains intersection point.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
