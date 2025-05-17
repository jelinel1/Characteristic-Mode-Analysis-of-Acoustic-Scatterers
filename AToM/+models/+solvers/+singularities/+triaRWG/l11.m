%% Edge integral from R, see DOI: 10.1109/8.247786
% This function evaluates edge integral from R via Eq. (12) from
% DOI: 10.1109/8.247786.
%
% INPUTS
%  sn: starting point of the edge in s system, double [Ntria x 1]
%  sp: end point of the edge in s system, double [Ntria x 1]
%  R0: distance from o to the edge, double [Ntria x 1]
%  Rn: distance from o to the begining of the edge, double [Ntria x 1]
%  Rp: distance from o to the end of the edge, double [Ntria x 1]
%  I: value of the edge integral from 1/R, see l10 function, double [Ntria x 1]
%
% OUTPUTS
%  J: value of the corresponding integral, double [Ntria x 1]
%
% SYNTAX
%
% [J] = models.solvers.singularities.triaRWG.l11(...
%           sn, sp, R0, Rn, Rp, I)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Xuezhi Zheng, KU Leuven, xuezhi.zheng@esat.kuleuven.be
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz
