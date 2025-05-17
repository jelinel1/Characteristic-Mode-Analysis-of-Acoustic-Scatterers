%% evaluates 1/R integral over a triangle, see DOI: 10.1109/8.247786
% This function evaluates evaluates 1/R integral over a triangle,
% see DOI: 10.1109/8.247786. The integral is evaluated via Eq. (19) from
% DOI: 10.1109/8.247786.
%
% INPUTS
%  s1n: starting point of the 1st edge in s system, double [Ntria x 1]
%  s1p: end point of the 1st edge in s system, double [Ntria x 1]
%  s2n: starting point of the 2nd edge in s system, double [Ntria x 1]
%  s2p: end point of the 2nd edge in s system, double [Ntria x 1]
%  s3n: starting point of the 3rd edge in s system, double [Ntria x 1]
%  s3p: end point of the 3rd edge in s system, double [Ntria x 1]
%  t10: inplane distance from o to the 1st edge, double [Ntria x 1]
%  t20: inplane distance from o to the 2nd edge, double [Ntria x 1]
%  t30: inplane distance from o to the 3rd edge, double [Ntria x 1]
%  w0: coordinatges of o along w, double [Ntria x 3]
%  R10: distance from o to the 1st edge, double [Ntria x 1]
%  R20: distance from o to the 2nd edge, double [Ntria x 1]
%  R30: distance from o to the 3rd edge, double [Ntria x 1]
%  R1n: distance from o to the begining of the 1st edge, double [Ntria x 1]
%  R1p: distance from o to the end of the 1st edge, double [Ntria x 1]
%  R2n: distance from o to the begining of the 2nd edge, double [Ntria x 1]
%  R2p: distance from o to the end of the 2nd edge, double [Ntria x 1]
%  R3n: distance from o to the begining of the 3rd edge, double [Ntria x 1]
%  R3p: distance from o to the end of the 3ed edge, double [Ntria x 1]
%  L1: line integral along the 1st edge from 1/R and R, double [Ntria x 2]
%  L2: line integral along the 2nd edge from 1/R and R, double [Ntria x 2]
%  L3: line integral along the 3rd edge from 1/R and R, double [Ntria x 2]
%
% OUTPUTS
%  S: value of the integral, double [Ntria x 1]
%
% SYNTAX
%
% S = models.solvers.singularities.triaRWG.ints0( s1n, s1p, s2n, s2p,...
% s3n, s3p, t10, t20, t30, w0, R10, R20, R30, R1n, R1p, R2n, R2p,...
% R3n, R3p, L1, L2, L3 )
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Xuezhi Zheng, KU Leuven, xuezhi.zheng@esat.kuleuven.be
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz
