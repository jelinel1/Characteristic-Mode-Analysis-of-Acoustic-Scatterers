%% calculateCurrentDecomposition calculates current decoposition
% This decomposition is based on S matatrix which is defined in
% https://arxiv.org/pdf/1709.09976.pdf.
%
%  INPUTS
%   mesh:      mesh struct created by AToM, struct [1 x 1]
%   basisFcns: basis functions struct created by AToM, struct [1 x 1]
%   iVec:      vector of expansion coeficients, double [M x N]
%               M - number of basis functions
%               N - number of frequency points
%   frequency: vector of frequencies, double [1 x N]
%
%  INPUTS
%  (parameters)
%   'maxDegreeL'       maximal degree of used spherical harmonics,
%                       double [1 x 1], default: 5
%   'quadratureOrder'  used gaussian quadrature order in integration,
%                       double [1 x 1], integer <1, 12>, default: 1
%
%  OUTPUTS
%   decomposition:   decomposition matrix, double [N x M]
%                     N - number of used modes
%                     M - number of frequencies
%   indexMatrix:     indexation matrix used to identify modes,
%                     double [5 x N]
%                     N - number of used modes
%
%  SYNTAX
%
%  decomposition = results.calculateCurrentDecomposition(mesh, ...
%     basisFcns, iVec, frequency)
%  [decomposition, I] = results.calculateCurrentDecomposition(mesh, ...
%     basisFcns, iVec, frequency, 'maxDegreeL', 10, 'quadratureOrder', 2);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode docu
