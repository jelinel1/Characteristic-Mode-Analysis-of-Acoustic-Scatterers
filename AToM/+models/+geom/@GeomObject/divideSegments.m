%% divideSegments divide segments in specified point
% This method divides segments in points specified by structure.
%
%  INPUTS
%   obj: object of interest, GeomObject [1 x 1]
%   segToDivide: struct [1 x 1]
%               .segNums: seg part #, seg #, double [nD x 2]
%               .point: point where to divide segments, double [nD x 3]
%               .parameter: parametric expression in Seg, [nD x 1]
%
%  SYNTAX
%
%  obj.divideSegments(segToDivide)
%
% Method divideSegments divides segments specified in structure _segToDivide_>
% _segNums_ conntains number of Seg part and number of segment in Seg Part,
% position of division is defined by _point_ and _parameter_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
