%% scale scales object according to vector
% This function scales specified object by vector. The object center point
% remains at the same place and individual dimensions of object are multiplied
% by values from specified vector.
%
%  INPUTS
%   obj: geometry object
%   vect: scaling vector, double [1 x 3]
%   callerName: name of calling function, char [1 x N]
%
%  OUTPUTS
%   trMatrix: transformation matrix, double [4 x 4]
%
%  SYNTAX
%
%  trMatrix = obj.scale(vect, callerName)
%
% Object obj is scaled so that its center remain at the same position and size
% is changed according to values in vector _vect_.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
