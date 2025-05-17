%% computeDS derivative of S matrix
% S matrix assembled according to https://arxiv.org/pdf/1709.09976.pdf
%
% matrix properties:
%
%  odd rows  - TE modes
%  even rows - TM modes
%
%  INPUTS
%   mesh: mesh structure, struct [1 x 1]
%   basisFcns: basis functions structure, struct [1 x 1]
%   frequency: frequency, double [1 x 1]
%
%  INUPUTS
%   (optional)
%   maxDegreeL:      maximal degree of used spherical functions,
%                     double [1 x 1], default value 15
%   quadratureOrder: order of Gaussian quadrature, double [1 x 1],
%                     integers <1 , 12>, default value 1
%
%  OUTPUTS
%   dS:          S matrix derivative, double [N x M]
%
%  SYNTAX
%
%  dS = computeDS(mesh, basisFcns, frequency)
%  dS = computeDS(mesh, basisFcns, frequency)
%  dS = computeDS(mesh, basisFcns, frequency, ...
%                         maxDegreeL, quadratureOrder)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
