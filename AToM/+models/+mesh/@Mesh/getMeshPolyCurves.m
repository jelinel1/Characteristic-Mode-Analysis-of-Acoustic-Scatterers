%% getMeshPolyCurves loads polycurves from geom and parametrizes them
% This function loads poly curves from object of class geom and computes their
% analytic equations. And then calls specialized functions to create mesh.
% Polycurve consists of different type of curves. Each type of curve is meshed
% by specific algorithm.
%
%  INPUTS
%   obj: object of class Mesh, [1 x 1]
%
%  SYNTAX
%
%   obj.getMeshPolyCurves()
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Ondrej Kratky, CTU, ondrej.kratky@antennatoolbox.com
