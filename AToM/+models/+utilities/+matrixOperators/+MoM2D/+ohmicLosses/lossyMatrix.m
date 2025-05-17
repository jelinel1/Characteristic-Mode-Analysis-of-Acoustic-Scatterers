%% lossymatrix calculate L matrix for calculation of ohmic losses
% calculate L matrix for calculation of ohmic losses
%
%  INPUTS
%   mesh: mesh structure, struct [1 x 1]
%   basisFcns: basis functions, struc [1 x 1]
%   rhoTria [nTria x 1]
%
%  OUTPUTS
%   L .. lossy matrix [nEdges x nEdges]
%   T
%   F
%   FL .. transform structure for rhoEdge -> rhoTria [6 x 5 x nTria]
%    1st dimension: 6 edges for each triangle
%    2nd dimension:
%     FL(:, 1, iTria) .. number of edge 1
%     FL(:, 2, iTria) .. number of edge 2
%     FL(:, 3, iTria) .. contribution to lossy matrix
%     FL(:, 4, iTria) .. sign of edge 1
%     FL(:, 5, iTria) .. sign of edge 2
%
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% (c) 2017, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com
% mcode docu
