%% LEGENDRECOMPONENTS_CELL Calculates associated legendre polynomials and its
% multiplies
% It is used to buid M and N functons. Singularity treatment is
% used.
%
%  INPUTS
%   n: degree of legendre polynomial, double [1 x 1]
%   cosTheta: cosinus of theta component coordinate of integration point,
%             double [N x 1]
%
%  OUTPUTS
%   l: associated legendre polynomial, doble [N x 1]
%   dl: derivative of l, double [N x 1]
%   msl: singularity treatement for (m / sin(theta)) * P, double [N x 1]
%
%  SYNTAX
%   [l, dl, msl] = legendreComponents(n, cosTheta);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode
