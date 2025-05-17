%% intersectLines3D computes intersection point of two lines in 3D.
% Implemented according to:
% https://math.stackexchange.com/questions/270767/find-intersection-of-two-3d-lines
% This is public function.
%
%  INPUTS
%   X1, X2: start and end point of first line, double [1 x 3]
%   Y1, Y2: start and end point of second line, double [1 x 3]
%
%  OUTPUTS
%   I: intersection point coordinates, double [1 x 3]
%   t: parameter of intersection point. If is in interval [0,1], intersection
%      point lies between defining points, double [1 x 1]
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
% mcode docu
