%% zGauss solves impedance matrix contributions using 1D Gauss quadrature
% Impedance matrix element Zmn is formed by a sum of four contributions named
% "++", "+-", "-+", "--" where XY is a general pattern for this combination.
% This function solves impedance matrix contributions for places where
% quadrature points are far enough from each other.
%
%  INPUTS
%   k: normalized wave number, double [1 x 1], in [-]
%   chi: +/- normalized multipl. of edge lengths lM,lN, double [M x 1], in [-]
%   wPwQ: multiplication of quadrature weights wP, wQ, double [1 x N], in [-]
%   rhoDot: dot(rhoM, rhoN), double [M x N], in [-]
%   r: normalized distances between quadrature points, double [M x N], in [-]
%
%  OUTPUTS
%   zXYmn: impedance matrix contributions, complex double [N x 1], in [Ohm*m^2]
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
