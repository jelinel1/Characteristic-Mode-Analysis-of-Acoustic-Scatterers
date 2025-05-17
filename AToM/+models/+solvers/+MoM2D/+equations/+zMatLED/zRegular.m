%% zRegular solves impedance matrix contributions using 2D Gauss quadrature
% Impedance matrix element Zmn is formed by a sum of four contributions named
% "++", "+-", "-+", "--" where XY is a general pattern for this combination.
% This function solves impedance matrix contributions for places where
% quadrature points are far enough from each other.
%
%  INPUTS
%   r: normalized distances between quadrature points,
%      double [size of zXYmn], in [-]
%
%  OUTPUTS
%   zXYmn: impedance matrix contributions,
%          complex double [nRows*2*nQuadPoints x 2*nQuadPoints x nResults],
%          in [-]
%
%  SYNTAX
%
%  zXYmn = zRegular(~, ~, ~, r, ~, ~, ~)
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
