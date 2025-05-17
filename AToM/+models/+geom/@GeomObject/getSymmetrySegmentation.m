%% getSymmetrySegmentation get segmentation when symmetries applied
% This method gives back segmentation
%
%  INPUTS
%   obj: object of interest, GeomObject [1 x 1]
%   symmTypes: types of symmetry ('xy', 'xz', 'yz'), cell [1 x nSymm]
%
%  OUTPUTS
%   symmSeg: segmentation (viz Segmentation doc) of part, Segmentation [1 x 1]
%   onSymmetry, is some segPart on Symmetry Plane, cell{1, nSegParts} of chars
%   intersectLines, iintersetLine segments, IntersectLine [1, nISL]
%
%  SYNTAX
%
%  [symmSeg, onSymmetry, intersectLine] = getSymmetrySegmentation( ...
% obj, symmTypes)
%
% Method getSymmetrySegmentation computes for segmentation of part of
% symmetry GeomObject _obj_. The part of segmentation is stored in _symmSeg,
% which is an object of class Segmentation.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% docu
