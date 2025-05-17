%% checkSegmentsOverlapLine determine if line is ovelapped by segments of object
% This method determines if a line defined by two 3D points is overlapped by
% segments of GeomObject.
%
%  INPUTS
%   obj: object if interest, GeomObject [1 x 1]
%   line: 3D points of line, double [2 x 3]
%
%  OUTPUTS
%   isOver: is line overlapped by any segment, logical [1 x 1]
%
%  SYNTAX
%
%  isOver = obj.checkSegmentsOverlapLine(line)
%
% Method checkSegmentsOverlapLine determines if _line_ is overlapped by segments
% of _obj_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
