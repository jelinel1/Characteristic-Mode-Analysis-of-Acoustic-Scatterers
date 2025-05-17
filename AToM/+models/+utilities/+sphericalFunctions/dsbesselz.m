%% DSBESSELZ Calculates derivative of spherical bessel function given in fcn
% as a handle
%
%  INPUTS
%   fcn: anonymous function to original bessel function, function handle [1 x 1]
%   n: order, double [1 x 1]
%   x: argument, double [N x 1]
%   h: order of Bessel function, double [1 x 1], value 1 or 2
%
%  OUTPUTS
%   dsz = derivative of selected bessel function, double [N x 1]
%
%  SYNTAX
%   dsz = dsbesselz(fcn, n, x, h)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode
