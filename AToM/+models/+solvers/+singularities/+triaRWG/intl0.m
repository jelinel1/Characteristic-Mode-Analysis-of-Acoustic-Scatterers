%% all edge integrals from 1/R and R, see DOI: 10.1109/8.247786
% This function evaluates all edge integrals from 1/R and R,
% see DOI: 10.1109/8.247786. Particularly it evaluates Eq. (12) in
% DOI: 10.1109/8.247786 evaluated for all edges.
%
% INPUTS
%  s1n: starting point of the 1st edge in s system, double [Ntria x 1]
%  s1p: end point of the 1st edge in s system, double [Ntria x 1]
%  s2n: starting point of the 2nd edge in s system, double [Ntria x 1]
%  s2p: end point of the 2nd edge in s system, double [Ntria x 1]
%  s3n: starting point of the 3rd edge in s system, double [Ntria x 1]
%  s3p: end point of the 3rd edge in s system, double [Ntria x 1]
%  R10: distance from o to the 1st edge, double [Ntria x 1]
%  R20: distance from o to the 2nd edge, double [Ntria x 1]
%  R30: distance from o to the 3rd edge, double [Ntria x 1]
%  R1n: distance from o to the begining of the 1st edge, double [Ntria x 1]
%  R1p: distance from o to the end of the 1st edge, double [Ntria x 1]
%  R2n: distance from o to the begining of the 2nd edge, double [Ntria x 1]
%  R2p: distance from o to the end of the 2nd edge, double [Ntria x 1]
%  R3n: distance from o to the begining of the 3rd edge, double [Ntria x 1]
%  R3p: distance from o to the end of the 3ed edge, double [Ntria x 1]
%
% OUTPUTS
%  I1: value of the edge integral from 1/R and R for the 1st edge,
%      double [Ntria x 2]
%  I2: value of the edge integral from 1/R and R for the 1st edge,
%      double [Ntria x 2]
%  I3: value of the edge integral from 1/R and R for the 1st edge,
%      double [Ntria x 2]
%
% SYNTAX
%
%   [ I1, I2, I3 ] = models.solvers.singularities.triaRWG.intl0 ...
%   ( s1n, s1p, s2n, s2p, s3n, s3p, R10, R20, R30, ...
%    R1n, R1p, R2n, R2p, R3n, R3p)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Xuezhi Zheng, KU Leuven, xuezhi.zheng@esat.kuleuven.be
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz
