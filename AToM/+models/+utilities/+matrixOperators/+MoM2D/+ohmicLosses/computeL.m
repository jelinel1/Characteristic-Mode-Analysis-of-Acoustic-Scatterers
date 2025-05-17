%% computeL Compute L matrix for calculation of ohmic losses
% Compute L matrix for calculation of ohmic losses
%
%  INPUTS
%   mesh: mesh structure, struct [1 x 1]
%   basisFcns: basis functions, struc [1 x 1]
%   rho: [nTria x 1] for  mode='triangles', [nEdges x 1] for mode='edges'
%   mode: string: {'triangles' - default, 'edges'}
%
%  OUTPUTS
%   L: lossy matrix [nEdges x nEdges]
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% (c) 2017, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com
% mcode docu
