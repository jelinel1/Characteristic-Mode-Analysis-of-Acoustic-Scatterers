%% computePiFactor compute matrix of Pi factors
% Pi factor is computed as max(abs(J_n)) / (1 + lambda_n^2)
%
%  INPUTS
%   IorJ: eigVec or abs(J) [nEdges x nModes x nFreq]
%   eigNum: eigen numbers, double [nModes x nFreq]
%   mesh: mesh structure, struct [1 x 1]
%   basisFcns: basis functions, struct [1 x 1]
%
%  OUTPUTS
%   PiFac: Pi factor [nModes x nFreq]
%
%  SYNTAX
%
%  PiFac = computePiFactor(Jabs, eigNum)
%  PiFac = computePiFactor(eigVec, eigNum, mesh, basisFcns)
%
% Reference
%
% J. L. T. Ethier and D. A. Mcnamara, "Modal significance measure in
% characteristic mode analysis of radiating structures," in Electronics
% Letters, vol. 46, no. 2, pp. 107-108, January 21 2010.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com
% mcode docu
