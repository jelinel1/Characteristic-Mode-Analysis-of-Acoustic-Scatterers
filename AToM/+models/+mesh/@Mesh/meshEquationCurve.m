%% meshEquationCurve create mesh from equation curve
% This function creates mesh from equation curve.
%
%  INPUTS
%   obj: object of class Mesh1D, [1 x 1]
%   eqX: handle function to X coordinate, char [1 x N]
%   eqY: handle function to Y coordinate, char [1 x N]
%   eqZ: handle function to Z coordinate, char [1 x N]
%   fh: handle of density function, char [1 x 1]
%   h0: maximal length of each element, double [1 x 1]
%   parameter: interval for parameter, double [1 x 2]
%   fixPoints: fix points given parametrically, double [1 x N]
%   maxElem: max element size, double [1 x 1]
%
%  OUTPUTS
%   nodes: coordinates of points, double [N x 3]
%   elements: pointers on nodes which represents lines of mesh, double [N x 2]
%
%  SYNTAX
%   [nodes, elements] = obj.meshEquationCurve(eqX, eqY, eqZ, fh, h0, parameter, fixPoints, maxElem)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Vit Losenicky, CTU, vit.losenicky@antennatoolbox.com
% (c) 2015, Ondrej Kratky, CTU, ondrej.kratky@antennatoolbox.com
