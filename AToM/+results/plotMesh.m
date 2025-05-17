%% plotMesh generates plot of given structure
% Creates plot of mesh.
%
%  INPUTS
%   mesh:      mesh struct created by AToM, struct [1 x 1]
%
%   INPUTS
%  (parameters)
%   'options'     ploting options, list below, struct [1 x 1]
%   'handles'     handles to the modification, struct [1 x 1]
%   'template'    template containing graphic rules, struct [1 x 1]
%
%  Options structure, logical [1 x 1] in each field
%   options.showNodes             generate point for each node
%   options.showNodeNumbers       generate numbers of nodes
%   options.showEdges             generate edges (line object)
%   options.showEdgesNumbers      generate numbers of edges
%   options.showEdgesArrows       generate arrows to show orientation of
%                                  edges
%   options.showTriangles         generate triangles (patch object)
%   options.showTriangleNumbers   generate numbers of triangles
%
%  OUTPUTS
%   handles:   structure with all graphic objects, struct [1 x 1]
%
%  SYNTAX
%
%  handles = results.plotMesh(mesh)
%  handles = results.plotMesh(mesh, 'options', options)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
