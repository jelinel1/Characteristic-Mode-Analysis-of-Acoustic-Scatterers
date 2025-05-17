%% splitComplexCycles find if cycles are complex and split them
% This static method finds cycles with a twist and splits them into simple
% polygon cycles.
%
%  INPUTS
%   segments: segment numbers, double [nSeg x 2]
%   sumAdj: sum adjacency Matr. (nodes with two edges 2, four 4), d. [1 x nSeg]
%   order: 1# order of segments; 2# part number, double [2 x nSeg]
%   dir: direction of segments - 0 same, 1 opposite, double {1x nSeg}
%
%  OUTPUTS
%   order: resulting segments numbers, double [3 x nSegments]
%   dir: direction of segment, 0 same, 1 change, logical [1 x 1]
%
%  SYNTAX
%
%  [order, dir] = models.geom.Boolean.splitComplexCycles(segments, order, dir)
%
% Cycles specified in _order_ are splitted into simplex polygons and then
% transformed to CCW polygons saved in dir.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% clear all
% close all
% clc
% segments = [1, 2; 2 3; 3 4;4 5; 5 6; 6 7; 7 5; 5 3; 3 8; 8 9; 9 3; 3 1];
%
% sumAdj = [2 2 6 2 4 2 2 2 2];
% order = 1:size(segments, 1);
% dir = false(1, size(segments, 1));
