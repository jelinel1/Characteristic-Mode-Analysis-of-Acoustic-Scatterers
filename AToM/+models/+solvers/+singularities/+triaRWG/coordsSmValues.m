%% coordinates in s,m basis, see DOI: 10.1109/8.247786
% This function evaluates coordinates in s,m basis, see DOI: 10.1109/8.247786.
% Variable sn menas s^-, while sp means s^+, see Fig. 1 a (3) in
% DOI: 10.1109/8.247786. Variable t0 is an inplane distance from the observation
% point to a coresponding edge, See Fig. 1. Variable R0 is a distance from the
% observation point to a coresponding edge, see Fig. 1. Variables Rp, Rn are
% distances from the observation point to a coresponding edpoint of a triangle
% edge, see Fig. 1.
%
% INPUTS
%  o: observation point, double [1 x 3]
%  p1: triangle points, double [Ntria x 3]
%  p2: triangle points, double [Ntria x 3]
%  p3: triangle points, double [Ntria x 3]
%  w: unit vector of u,v,w basis, double [Ntria x 3]
%  s1: basis vectors, double [Ntria x 3]
%  s2: basis vectors, double [Ntria x 3]
%  s3: basis vectors, double [Ntria x 3]
%  m1: basis vectors, double [Ntria x 3]
%  m2: basis vectors, double [Ntria x 3]
%  m3: basis vectors, double [Ntria x 3]
%
% OUTPUTS
%  s1n: starting point of the 1st edge in s system, double [Ntria x 1]
%  s1p: end point of the 1st edge in s system, double [Ntria x 1]
%  s2n: starting point of the 2nd edge in s system, double [Ntria x 1]
%  s2p: end point of the 2nd edge in s system, double [Ntria x 1]
%  s3n: starting point of the 3rd edge in s system, double [Ntria x 1]
%  s3p: end point of the 3rd edge in s system, double [Ntria x 1]
%  t10: inplane distance from o to the 1st edge, double [Ntria x 1]
%  t20: inplane distance from o to the 2nd edge, double [Ntria x 1]
%  t30: inplane distance from o to the 3rd edge, double [Ntria x 1]
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
% SYNTAX
%
% [s1n, s1p, s2n, s2p, s3n, s3p, t10, t20, t30, R10, R20, R30, ...
% R1n, R1p, R2n, R2p, R3n, R3p] = ...
% models.solvers.singularities.triaRWG.coordsSmValues(o, p1, p2, ...
% p3, s1, m1, s2, m2, s3, m3, w)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Xuezhi Zheng, KU Leuven, xuezhi.zheng@esat.kuleuven.be
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz
