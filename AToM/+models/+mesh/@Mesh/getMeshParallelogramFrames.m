%% getMeshParallelogramFrames loads parallelogram frames from geom and parametrizes them
% This function loads parallelogram frames from object of class geom
% and computes their analytic equations. And then calls specialized function
% to create mesh. Each side is meshed as single line.
%
%  INPUTS
%   obj: object of class Mesh, [1 x 1]
%   meshObjects: MeshObject objects, [N x 1]
%
%  SYNTAX
%
%   obj.getMeshParallelogramFrames()
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Vit Losenicky, CTU, vit.losenicky@antennatoolbox.com
% (c) 2015, Ondrej Kratky, CTU, ondrej.kratky@antennatoolbox.com
