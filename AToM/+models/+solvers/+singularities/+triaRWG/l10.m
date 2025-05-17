%% Edge integral from 1/R, see DOI: 10.1109/8.247786
% This function evaluates edge integral from 1/R via Eq. (11) from
% DOI: 10.1109/8.247786. The equality
% log((sp + Rp) ./ (sn + Rn)) = - log((sp - Rp) ./ (sn - Rn)) is
% used to treat cases when observation point lies on the extension of the
% triangle edge and to improve precision in general.
%
% INPUTS
%  sn: starting point of the edge in s system, double [Ntria x 1]
%  sp: end point of the edge in s system, double [Ntria x 1]
%  Rn: distance from o to the begining of the edge, double [Ntria x 1]
%  Rp: distance from o to the end of the edge, double [Ntria x 1]
%
% OUTPUTS
%  I: value of the corresponding integral, double [Ntria x 1]
%
% SYNTAX
%
% [I] = models.solvers.singularities.triaRWG.l10(sn, sp, Rn, Rp)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Xuezhi Zheng, KU Leuven, xuezhi.zheng@esat.kuleuven.be
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz
