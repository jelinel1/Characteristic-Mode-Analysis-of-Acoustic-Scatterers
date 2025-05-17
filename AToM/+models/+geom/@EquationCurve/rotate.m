%% rotate rotate object around vector by angle
% This function rotates specified object by angle around line defined by vector
% starting at origin O.
%
%  INPUTS
%   obj: geometry object
%   vect: definition of rotation axis, double [1 x 3]
%   angle: rotation angle, double [1 x 1] in [rad]
%   callerName: name of calling function, char [1 x N]
%
%  OUTPUTS
%   trMatrix: transformation matrix, double [4 x 4]
%
%  SYNTAX
%
%  trMatrix = obj.rotate(vect, angle, callerName)
%
% Object obj is rotated by _angle_ in radians around axis specified by _vect_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
