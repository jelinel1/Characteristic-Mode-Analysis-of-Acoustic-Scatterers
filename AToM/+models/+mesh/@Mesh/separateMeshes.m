%% separateMeshes separates 1D and 2D meshes
%  1D and 2D meshes are separated and subsripts in edges 1D and connectivityList
%  are recalculated with respect to nodes1D and nodes2D
%
%  INPUTS
%   mesh: Mesh object, Mesh [1 x 1]
%   name: name of Mesh object to delete, char [1 x N]
%
%  OUTPUTS
%   nodes1D: points of 1D mesh, double [N x 3]
%   edges1D: 1D mesh elements, double [N x 2]
%   nodes2D: points of 2D mesh, double [N x 3]
%   connectivityList: 2D mesh elements, double [N x 3]
%
%  SYNTAX
%   separateMeshes(name);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU, martin.strambach@antennatoolbox.com
