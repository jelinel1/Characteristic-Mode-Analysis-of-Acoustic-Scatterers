%% edgeSymPlanes get information about edges touching symmetry plane
%  The function returns information of edges belonging to symmetry planes.
%  The _symPlaneInfo_ contains 1 on positions where the edge touches given
%  symmetry plane ([0 1 0] means that edge is lying in plane XZ).
%
%  INPUTS
%   nodes: node coordinates
%   edges: node IDs of edges
%
%  OUTPUTS
%   symPlaneInfo: symmetry plane information
%
%  SYNTAX
%
%  symPlaneInfo = models.utilities.meshPublic.edgeSymPlanes(nodes, edges);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
% mcode docu
