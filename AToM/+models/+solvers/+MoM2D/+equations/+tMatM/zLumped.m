%% zLumped solves impedance matrix contributions from lumped elements in 2D
% Impedance matrix element Zmn is formed by a sum of four contributions named
% "++", "+-", "-+", "--" where XY is a general pattern for this combination.
% This function solves impedance matrix contributions from lumped elements.
%
%  INPUTS
%   edgeLengthsSq: square root of edge lengths,
%                  double [size of zXYmn], in [-]
%
%  OUTPUTS
%   zXYmn: contributions to lumped elements
%          complex double [nRows*2*nQuadPoints x 2*nQuadPoints x nResults],
%          in [-]
%
%  SYNTAX
%
%  zXYmn = zLumped(edgeLengthsSq, ~, ~)
%
% Default syntax, no input arguments are necessary.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
