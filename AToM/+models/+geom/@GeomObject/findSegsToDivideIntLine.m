%% findSegsToDivideIntLine findsegments to divide by intersecting line
% This method determines if a line defined by 2 3D points crosses segments of
% GeomObject.
%
%  INPUTS
%   obj: object if interest, GeomObject [1 x 1]
%   line: 3D points of line, double [2 x 3]
%   partNum: part of segmentation to check, double [1 x 1]
%   otherObj: other object from bool. operation, GeomObject [1 x 1]
%   otherNum: part of segmentation to check, double [1 x 1]
%
%
%  OUTPUTS
%   segToDivide: struct [1 x 1]
%               .segNums: seg part #, seg #, double [nD x 2]
%               .point: point where to divide segments, double [nD x 3]
%               .parameter: parametric expression in Seg, [nD x 1]
%   lineParams: parameters of Line segments, double [2*nLineSegs x 1]
%   linePoints: points on intersecting line
%
%  SYNTAX
%
%  [segToDivide, lineParams, linePoints] = ...
% obj.findSegsToDivideIntLine(line, partNum)
%
% Method findSegsToDivideIntLine determines if _line_ intersects with segments
% of _obj's_ part specified by _partNum_ and determines segments of _obj_ that
% should be divided (_segToDivide_). Crossing points on line are determined both
% by the parameters _lineParams_ and segment points _linePoints_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
