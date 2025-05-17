%% createSegCycles create data structure of cycle segments after bool operations
% This method creates data structure necessary for definition of objectc after
% Boolean opertaion.
%
%  INPUTS
%   order: cycle indicators [2 x N]
%   tempSeg: segment set, double [2*nSegments x 3]
%   tempPar: parameter set, double [2*nSegments x 1]
%   tempType: type of segments set, double [nSegments x 2]
%   obj1: GeomObject [1 x 1]
%   obj2: GeomObject [1 x 1]
%   coordSys: local coordinate system, struct
%     .origin: origin point, double [1 x 3]
%     .localX: local x-axis vector, double [1 x 3]
%     .localY: local y-axis vector, double [1 x 3]
%     .localZ: local z-axis vector, double [1 x 3]
%
%  OUTPUTS
%   same1: indeces of same segments from set 1
%   same2: indeces of same segments from set 2
%
%  SYNTAX
%
%  [segCell, parCell, typeCell, isHolesCell] = ...
% models.geom.Boolean.createSegCycles(seg1, seg2, segType1, segType2, tol)
%
% The data structure for definition of object segments is formed using
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
