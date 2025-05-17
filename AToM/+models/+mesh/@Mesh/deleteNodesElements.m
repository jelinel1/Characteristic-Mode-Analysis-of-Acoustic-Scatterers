%% deleteNodesElements deletes nodes and element of specific meshObject
%  This function deletes nodes and elements of specific object or group of
%  objects and than calls function uniqueNodesElements to fix the mesh
%
%  INPUTS
%   obj: Mesh object, [1 x 1]
%   varargin: list of Mesh objects, [1 x N]
%
%  SYNTAX
%
%  obj.deleteNodesElements()
%  obj.deleteNodesElements(meshObjects)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% (c) 2015, Ondrej Kratky, CTU in Prague, ondrej.kratky@antennatoolbox.com
