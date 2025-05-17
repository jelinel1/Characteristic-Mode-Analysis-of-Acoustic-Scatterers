%% rotateY rotate object around Y-axis by angle
% This function rotates specified object by angle in rad around Y-axis
% [0, 1, 0].
%
%  INPUTS
%   obj: geometry object
%   angle: rotation angle, double [1 x 1] in [rad]
%   callerName: name of calling function, char [1 x N]
%
%  OUTPUTS
%   trMatrix: transformation matrix, double [4 x 4]
%
%  SYNTAX
%
%  trMatrix = obj.rotateY(angle, callerName)
%
% Object obj is rotated by _angle_ in radians around Y-axis [0, 1, 0].
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
