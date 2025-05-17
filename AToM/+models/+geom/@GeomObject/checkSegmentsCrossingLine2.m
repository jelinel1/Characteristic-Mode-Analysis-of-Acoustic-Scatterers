%% checkSegmentsCrossingLine determine if line crosses segments of an object
% This method determines if a line defined by 2 3D points crosses segments of
% GeomObject.
%
%  INPUTS
%   obj: object if interest, GeomObject [1 x 1]
%   line: 3D points of line, double [2 x 3]
%   partNums: part # where line is In, double [nParts x 1]
%
%  OUTPUTS
%   isInter: isSegment intersected, logical [1 x 1]
%   isOnBorder: is line on border, logical [1 x 1]
%   segToDivide: struct [1 x 1]
%               .segNums: seg part #, seg #, double [nD x 2]
%               .point: point where to divide segments, double [nD x 3]
%               .parameter: parametric expression in Seg, [nD x 1]
%   curveNums> curveNumbers that Line is in, cell [1 x nParts]
%
%  SYNTAX
%
%  [isInter, isOnBorder, segToDivide] = obj.checkSegmentsCrossingLine(line)
%
% Method checkSegmentsCrossingLine determines if _line_ intersects with segments
% of _obj_. If end point is touching the object, it is NOT cnsidered as
% intersection!
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
