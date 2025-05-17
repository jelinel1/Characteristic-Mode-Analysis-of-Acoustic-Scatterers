%% SBESSELJ Calculates spherical Bessel j function
% Limit at x->0 is treated (sj=1 for n=0 and sj=0 for n~=0).
%
%  INPUTS
%   n: order, double [1 x 1]
%   x: argument, double [N x 1]
%
%  OUTPUTS
%   sj: value of spherical Bessel function j in given points,
%       double [N x 1]
%
%  SYNTAX
%   sj = sbesselj(n, x);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode
