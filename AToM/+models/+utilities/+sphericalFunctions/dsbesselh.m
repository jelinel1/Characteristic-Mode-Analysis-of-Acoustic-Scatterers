%% DSBESSELH Calculates derivative of spherical Bessel h1 or h2 function
% Uses recurrence formula: d(z_n(x))/dx = z_{n-1}(x) - (n+1)/x*z_n(x)
%
%  INPUTS
%   n: order, double [1 x 1]
%   x: argument, double [N x 1]
%   h: order of Bessel function, double [1 x 1], value 1 or 2
%
%  OUTPUTS
%   dsh: value of derivative of spherical Bessel function h of given order
%        in given points, double [N x 1]
%
%  SYNTAX
%   dsh = dsbesselh(n, x, h)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode
