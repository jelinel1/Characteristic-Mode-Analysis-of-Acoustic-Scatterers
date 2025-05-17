%% projections between u,v and m basis, see DOI: 10.1109/8.247786
% This evaluates projections between u,v and m basis, see DOI: 10.1109/8.247786.
% These projections are need in formulas such as (20),(23) in
% DOI: 10.1109/8.247786.
%
% INPUTS
%  u: basis vectors, double [Ntria x 3]
%  v: basis vectors, double [Ntria x 3]
%  m1: basis vectors, double [Ntria x 3]
%  m2: basis vectors, double [Ntria x 3]
%  m3: basis vectors, double [Ntria x 3]
%
% OUTPUTS
%  fac10: projection factor, double [Ntria x 1]
%  fac11: projection factor, double [Ntria x 1]
%  fac12: projection factor, double [Ntria x 1]
%  fac20: projection factor, double [Ntria x 1]
%  fac21: projection factor, double [Ntria x 1]
%  fac22: projection factor, double [Ntria x 1]
%
% SYNTAX
%
% [fac10, fac11, fac12, fac20, fac21, fac22] = ...
% models.solvers.singularities.triaRWG.factors(u, v, m1, m2, m3 )
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Xuezhi Zheng, KU Leuven, xuezhi.zheng@esat.kuleuven.be
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz
