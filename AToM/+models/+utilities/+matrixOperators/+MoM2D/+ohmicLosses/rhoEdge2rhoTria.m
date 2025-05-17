%% rhoEdge2rhoTria recalculate resistivitiy of triangles from edges
%
%  INPUTS
%   mesh: mesh structure, struct [1 x 1]
%   FL: transform structure for rhoEdge -> rhoTria [6 x 5 x nTria]
%   rhoEdge: [nEdges x 1]
%   I: [nEdges x 1]
%
%  OUTPUTS
%   rhoTria: [nTria x 1]
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% (c) 2017, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com
% mcode docu
