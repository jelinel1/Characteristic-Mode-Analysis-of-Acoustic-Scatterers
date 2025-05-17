%% computeS calculates S matrix
% S matrix assembled according to https://arxiv.org/pdf/1709.09976.pdf
%
% matrix properties:
%
%  odd rows  - TE modes
%  even rows - TM modes
%
%  INPUTS
%   mesh:      mesh structure, struct [1 x 1]
%   basisFcns: basis functions structure, struct [1 x 1]
%   k:         wavenumbers, double [1 x 1]
%
%  INUPUTS
%   (optional)
%   maxDegreeL:      maximal degree of used spherical functions,
%                     double [1 x 1], default value 15
%   quadratureOrder: order of Gaussian quadrature, double [1 x 1],
%                     integers <1 , 12>, default value 1
%   wavesType: type of waves, double [1 x 1]
%              1 - regular waves, z = spherical Bessel function
%              2 - irregular waves, z = spherical Neumann function
%              3 - ingoing waves, z = spherical Hankel function 1
%              4 - outgoing waves, z = spherical Hankel function 2
%
%  OUTPUTS
%   S:           S matrix,   double [N x M]
%   indexMatrix: matrix of ordering in S matrix, double [5 x N]
%
%  SYNTAX
%
%  S = computeS(mesh, basisFcns, frequency)
%  [S, indexMatrix] = computeS(mesh, basisFcns, frequency)
%  [S, indexMatrix] = computeS(mesh, basisFcns, frequency, ...
%                         maxDegreeL, quadratureOrder)
%  [S, indexMatrix] = computeS(mesh, basisFcns, frequency, ...
%                         maxDegreeL, quadratureOrder, wavesType)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
