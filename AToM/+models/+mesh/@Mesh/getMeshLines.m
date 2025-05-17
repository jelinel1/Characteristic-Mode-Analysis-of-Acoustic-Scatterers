%% getMeshLines loads lines from geom and parametrizes them
% This function loads lines from object of class geom and computes their
% analytic equations. And then calls specialized function to create mesh.
%
%  INPUTS
%   obj: object of class Mesh, [1 x 1]
%   meshObjects: MeshObject objects, [N x 1]
%
%  SYNTAX
%
%   obj.getMeshLines(meshObjects)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Vit Losenicky, CTU, vit.losenicky@antennatoolbox.com
% (c) 2015, Ondrej Kratky, CTU, ondrej.kratky@antennatoolbox.com
