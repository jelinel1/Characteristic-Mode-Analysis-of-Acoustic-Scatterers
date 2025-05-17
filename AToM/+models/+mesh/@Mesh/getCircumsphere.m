%% getCircumsphere computes mesh circumsphere
%  A circumsphere is computed for the whole mesh and optionaly for each object.
%  If eachObject is true, first line is circumsphere of each object and next
%  lines are circumsphere of each Mesh Object.
%
%  INPUTS
%   obj: object of class Mesh, [1 x 1]
%
%  OUTPUTS
%   coordinates:
%     -radius: radius of a circumsphere, double [N x 1]
%     -center: center of a circumsphere, double [N x 3]
%
%  SYNTAX
%
%  [coordinates] = obj.getCircumsphere();
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Martin Strambach, CTU in Prague, martin.strambach@antennatoolbox.com
% docu
