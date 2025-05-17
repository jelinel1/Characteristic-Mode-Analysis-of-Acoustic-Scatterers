%% getTypesOfPoints find type of points of object.
%  INPUTS
%   obj: object of class MeshObject, [1 x 1]
%
%  OUTPUTS
%   points: struct with these fields:
%   inner: inner points of object, double [N x 3]
%   circuit: circuit points of object, double [N x 3]
%   holes: circuit points of holes, cell [M x 1], where M is quanity of holes
%
%  SYNTAX
%
%   circuitPoints = getCircuitPoints(obj)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Ondrej Kratky, CTU in Prague, ondrej.kratky@antennatoolbox.com
% (c) 2016, Vit Losenicky, CTU in Pregue, vit.losenicky@antennatoolbox.com
