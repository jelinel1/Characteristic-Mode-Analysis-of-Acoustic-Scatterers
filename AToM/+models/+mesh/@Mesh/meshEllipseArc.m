%% meshEllipseArc create mesh from ellipse arc
% This function creates mesh prom ellipse arc.
%
%  INPUTS
%   obj: object of class Mesh1D, [1 x 1]
%   C: ellipse center, double [1 x 3]
%   U: ellipse major vertex, double [1 x 3]
%   V: ellipse minor vertex, double [1 x 3]
%   fh: handle of density function, char [1 x 1]
%   h0: maximal length of each element, double [1 x 1]
%   parameter: interval for parameter, double [1 x 2]
%   fixPoints: fix points given parametrically, double [1 x N]
%   maxElem: max element size, double [1 x 1]
