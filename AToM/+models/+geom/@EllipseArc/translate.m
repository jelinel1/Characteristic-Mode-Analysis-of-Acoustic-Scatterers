%% translate translates object according to vector
% This function translates specified object by vector in meters.
%
%  INPUTS
%   obj: geometry object
%   vect: translation vector, double [1 x 3] in [m]
%   callerName: name of calling function, char [1 x N]
%
%  OUTPUTS
%   trMatrix: transformation matrix, double [4 x 4]
%
%  SYNTAX
%
%  trMatrix = obj.translate(vect, callerName)
%
% Object obj is translated to new position according to vector _vect_ in meters.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
