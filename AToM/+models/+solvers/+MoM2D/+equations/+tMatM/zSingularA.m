%% zSingularA solves impedance matrix contributions zXYmn analytically
% Impedance matrix element Zmn is formed by a sum of four contributions named
% "++", "+-", "-+", "--" where XY is a general pattern for this combination.
% This function solves impedance matrix contributions tMatM related to 1/R
% for places where quadrature points are overlapping.
% Contribution tMatM does not contain anything related to 1/R.
%
%  INPUTS
%   chi: +/- normalized multipl. of edge lengths lM,lN,
%        double [size of zXYmn], in [-]
%
%  OUTPUTS
%   zXYmn: contributions to tMatM,
%          complex double [nSingularTerms x 1 x nResults], in [-]
%
%  SYNTAX
%
%  zXYmn = zSingularA(~, chi, ~, ~, ~)
%
% Default syntax, no input arguments are necessary.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com
