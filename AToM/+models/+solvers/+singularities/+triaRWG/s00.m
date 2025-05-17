%% auxiliary function beta, see DOI: 10.1109/8.247786
% This function evaluates auxiliary function beta, see see Eq. (13)
% from DOI: 10.1109/8.247786.
%
% INPUTS
%  sn: starting point of the edge in s system, double [Ntria x 1]
%  sp: end point of the edge in s system, double [Ntria x 1]
%  t0: inplane distance from o to the edge, double [Ntria x 1]
%  w0: coordinatges of o along w, double [Ntria x 3]
%  R0: distance from o to the edge, double [Ntria x 1]
%  Rn: distance from o to the begining of the edge, double [Ntria x 1]
%  Rp: distance from o to the end of the edge, double [Ntria x 1]
%
% OUTPUTS
%  betai: value of betai, double [Ntria x 1]
%
% SYNTAX
%
% betai = models.solvers.singularities.triaRWG.s00( sn, sp, t0, w0,
%   R0, Rn, Rp )
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Xuezhi Zheng, KU Leuven, xuezhi.zheng@esat.kuleuven.be
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz
