%% updateSegments update segment due to Boolean operation
% This perfoirms subtract Boolean operation on specified objects.
%
%  INPUTS
%   s1: segments of obj1, cell [1 x 1]
%   s2: segments of obj2, cell [1 x 1]
%   sP1: param. segments of obj1, cell [1 x 1]
%   sP2: param.segments of obj2, cell [1 x 1]
%   sT1: types of segments of obj1, cell [1 x 1]
%   sT2: types of segments of obj2, cell [1 x 1]
%   h1: holes indicators for obj1, cell [1 x 1]
%   h2: holes indicators for obj2, cell [1 x 1]
%   iSS1: number of segment in Object 1, double [1 x 1]
%   iSS2: number of segment in Object 2, double [1 x 1]
%   iS1: number of segment in Object 1, double [1 x 1]
%   iS2: number of segment in Object 2, double [1 x 1]
%   iC1: number of cell of segmentation in Object 1, double [1 x 1]
%   iC2: number of cell of segmentation in Object 2, double [1 x 1]
%   obj1: Object 1, GeomObject [1 x 1]
%   obj2: Object 2, GeomObject [1 x 1]
%   points: intersection points, double [2 x 3]
%   callerName: optional, name of calling function, char [1 x N]
%   params: params of the intersec. pts. (for obj1, for obj2), double [1/2 x 2]
%
%  SYNTAX
%
%  [s1, s2, sP1, sP2, sT1, sT2, h1, h2, nAdded1, nAdded2] = ...
%    updateSegments(s1, s2, sP1, sP2, sT1, sT2, h1, h2, ...
%    iSS1, iSS2, iS1, iS2, iC1, iC2, obj1, obj2, points, params)
%
% Segmentation update.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
