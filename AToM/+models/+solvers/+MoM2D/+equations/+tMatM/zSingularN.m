%% zSingularN solves impedance matrix contributions using 2D Gauss quadrature
% Impedance matrix element Zmn is formed by a sum of four contributions named
% "++", "+-", "-+", "--" where XY is a general pattern for this combination.
% This function solves impedance matrix contributions tMatM for places where
% quadrature points are overlapping (same as zRegular, R = 0 does not matter).
%
%  INPUTS
%   k: normalized wave number, double [1 x 1], in [-]
%   chi: +/- normalized multipl. of edge lengths lM,lN,
%        double [size of zXYmn], in [-]
%   wPwQ: multiplication of quadrature weights wP, wQ,
%         double [size of zXYmn], in [-]
%   r: normalized distances between quadrature points,
%      double [size of zXYmn], in [-]
%   rhoDot: normalized dot(rhoM, rhoN),
%           double [size of zXYmn], in [-]
%
%  OUTPUTS
%   zXYmn: contributions to tMatM,
%          complex double [nRows*2*nQuadPoints x 2*nQuadPoints x nResults],
%          in [-]
%
%  SYNTAX
%
%  zXYmn = zSingularN(k, chi, wPwQ, r, rhoDot, ~, ~)
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
