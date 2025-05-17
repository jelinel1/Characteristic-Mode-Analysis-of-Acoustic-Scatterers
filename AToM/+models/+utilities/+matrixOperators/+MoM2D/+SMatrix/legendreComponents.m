%% legendreComponents Calculates associated legendre polynomials and its
% multiplies
% It is used to buid M and N functons. Singularity treatment is
% used.
%
%  INPUTS
%   degreeL:  degree l of legendre polynomial, double [N x 1]
%   orderM:   vector of orderes m belongings to degreel, double [N x 1]
%   cosTheta: cosinus of theta component coordinate of integration point,
%             double [N x 1]
%
%  OUTPUTS
%   normLegendreSing:    associated legendre polynomial with solved
%                        singularities, (m/sin(theta)) * P, double [N x 1]
%   normLegendreSingDer: derivative of legenre polynomial, double [N x 1]
%   normLegendre:        legendre polynomial for degree l and order m,
%                        double [N x 1]
%
%  SYNTAX
%   [normLegendreSing, normLegendreSingDer, normLegendre] = ...
%                           legendreComponents(degreeL, orderM, cosTheta)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode
