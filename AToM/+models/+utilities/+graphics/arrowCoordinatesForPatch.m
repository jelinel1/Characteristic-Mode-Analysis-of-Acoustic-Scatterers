%% arrowCoordinatesForPatch return coordinates of vertices suitable for patch to create arrow.
% Generated arrow is always in [0 0 1] direction.
% This is public method.
%
%  INPUT
%   N: number of sides of arrow, double [1 x 1]
%   L: length of arrow, double [1 x 1]
%   R: radius of arrow base, double [1 x 1]
%   centerPonint: coordinates of center of the arrow, double [1 x 3]
%   arrowDirection: direction of arrow, double [1 x 3]
%
%  OUTPUT
%   XData, YData, ZData: coordinates of vertices of arrow, double [3 x N]
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode
