%% rotateMesh rotates given set of points by given angles
%  This function takes nodes in 3D and rotates them by angles specified
%  in angles matrix. The coordinate system is right handed.
%
%  INPUTS
%   nodes: node coordinates, double[N x 3]
%   angles: angles for point rotation, double [1 x 3]
%
%  OUTPUTS
%   newNodes: nodes rotated by angles, double [N x 3]
%
%  SYNTAX
%
%  [newNodes] = models.utilities.meshPublic.rotateMesh(nodes, angles);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% mcode docu
