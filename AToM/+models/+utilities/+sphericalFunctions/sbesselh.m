%% SBESSELH Calculates spherical Bessel h1 or h2 function
% As optional outputs return jn and yn spherical bessel functions.
%
%  INPUTS
%   n: order, double [1 x 1]
%   x: argument, double [N x 1]
%   h: order of Bessel function, double [1 x 1], value 1 or 2
%
%  OUTPUTS
%   sh: value of spherical Bessel function h of given order in given points,
%       double [N x 1]
%   sj: value of spherical Bessel function j in given points,
%       double [N x 1]
%   sy: value of spherical Bessel function y in given points,
%       double [N x 1]
%
%  SYNTAX
%   sh = sbesselh(n, x, h);
%   [sh, sj, sy] = sbesselh(n, x, h)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode
