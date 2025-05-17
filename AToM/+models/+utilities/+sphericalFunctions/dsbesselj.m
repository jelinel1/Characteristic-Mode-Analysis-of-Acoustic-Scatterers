%% DSBESSELJ Calculates derivative of spherical bessel function j
% Uses recurrence formula: d(z_n(x))/dx = z_{n-1}(x) - (n+1)/x*z_n(x)
%
%  INPUTS
%   n: order, double [1 x 1]
%   x: argument, double [N x 1]
%
%  OUTPUTS
%   dsj: value of derivative of spherical Bessel function j in given points,
%        double [N x 1]
%
%  SYNTAX
%   dsj = dsbesselj(n, x)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode
