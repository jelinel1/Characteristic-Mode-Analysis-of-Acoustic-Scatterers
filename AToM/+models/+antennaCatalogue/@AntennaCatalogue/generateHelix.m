%% Bezier Generate Bezier curve
% This creates a Beziere curve points.
%
%  INPUTS
%   amin: Turn radius in m -Center, double [1 x 1]
%   amax: Turn radius in m -Top/Bottom, double [1 x 1]
%   M: Number of loop rectangles, double [1 x 1]
%   h: Width of the strip, double [1 x 1]
%   N: Number of turns, double [1 x 1]
%   S: Spacing between turns, double [1 x 1]
%
%  OUTPUTS
%   nodes: points, double [N x 2]
%   connectivityList: triangles - pointers to nodes, double [N x 3]
%
%  SYNTAX
%
%  [nodes, connectivityList] = generateHelix(amin, amax, M, h, N, S)
%
% The triangulation of Helix is created.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Miloslav Capek, CVUT, mila.capek@antennatoolbox.com
