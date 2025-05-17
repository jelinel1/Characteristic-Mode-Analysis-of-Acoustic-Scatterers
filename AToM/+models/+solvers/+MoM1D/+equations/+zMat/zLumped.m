%% zLumped1D solves impedance matrix contributions from lumped elements in 2D
% Impedance matrix element Zmn is formed by a sum of four contributions named
% "++", "+-", "-+", "--" where XY is a general pattern for this combination.
% This function solves impedance matrix contributions from lumped elements.
%
%  OUTPUTS
%   zXYmn: contributions to lumped elements, complex double [M x 1], in [-]
%
%  SYNTAX
%
%  zXYmn = zLumped2D()
%
% Default syntax, no input arguments are necessary.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
