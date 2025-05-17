%% evaluates u/R and v/R integral over triangle, see DOI: 10.1109/8.247786
% This function evaluates u/R and v/R integral over triangle,
% see DOI: 10.1109/8.247786. Integrals are evaluated using Eq. (21-23) from
% DOI: 10.1109/8.247786.
%
% INPUTS
%  fac10: projection factor, double [Ntria x 1]
%  fac11: projection factor, double [Ntria x 1]
%  fac12: projection factor, double [Ntria x 1]
%  fac20: projection factor, double [Ntria x 1]
%  fac21: projection factor, double [Ntria x 1]
%  fac22: projection factor, double [Ntria x 1]
%  u0: coordinatges of o along u, double [Ntria x 3]
%  v0: coordinatges of o along v, double [Ntria x 3]
%  L1: line integral along the 1st edge from 1/R and R, double [Ntria x 2]
%  L2: line integral along the 2nd edge from 1/R and R, double [Ntria x 2]
%  L3: line integral along the 3rd edge from 1/R and R, double [Ntria x 2]
%  S: 1/R integral over a triangle, double [Ntria x 1]
%
% OUTPUTS
%  Su: value of the u/R integral, double [Ntria x 1]
%  Sv: value of the v/R integral, double [Ntria x 1]
%
% SYNTAX
%
% [Su , Sv] = models.solvers.singularities.triaRWG.ints1(fac10, ...
% fac11, fac12, fac20, fac21, fac22, u0, v0, L1, L2, L3, S)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Xuezhi Zheng, KU Leuven, xuezhi.zheng@esat.kuleuven.be
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz
