%% zSingularN solves impedance matrix contributions using 2D Gauss quadrature
% Impedance matrix element Zmn is formed by a sum of four contributions named
% "++", "+-", "-+", "--" where XY is a general pattern for this combination.
% This function solves impedance matrix contributions related to exp(-jkR - 1)/R
% for places where quadrature points are overlapping.
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
%  zXYmn = zSingularN(~, ~, ~, ~, r, ~, ~)
%
% Default syntax, all input arguments must be set.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
