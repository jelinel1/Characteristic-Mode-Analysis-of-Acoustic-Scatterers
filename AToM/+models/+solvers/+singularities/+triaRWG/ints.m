%% Green's function integrals on a triangle, see DOI: 10.1109/8.247786
% This function evaluates Green's function integrals on a triangle,
% see DOI: 10.1109/8.247786. It integrates 1/R, u/R, v/R over a source
% triangles for a given observation point. Integration is made analytically
% and provides singularity treatment.
%
% INPUTS
%  o:	observation coordinate, double [1 x 3]
%  p1: source triangle points, double [Ntria x 3]
%  p2: source triangle points, double [Ntria x 3]
%  p3: source triangle points, double [Ntria x 3]
%  Ntria: numer of source triangles, double [1 x 1]
%  u: basis vectors, double [Ntria x 3]
%  v: basis vectors, double [Ntria x 3]
%  w: basis vectors, double [Ntria x 3]
%  s1: basis vectors, double [Ntria x 3]
%  s2: basis vectors, double [Ntria x 3]
%  s3: basis vectors, double [Ntria x 3]
%  m1: basis vectors, double [Ntria x 3]
%  m2: basis vectors, double [Ntria x 3]
%  m3: basis vectors, double [Ntria x 3]
%
% OUTPUTS
%  S: 1/R integral, double [Ntria x 1]
%  Su: u/R integral, double [Ntria x 1]
%  Sv: v/R integral, double [Ntria x 1]
%
% SYNTAX
%
% [S, Su, Sv] = models.solvers.singularities.triaRWG.ints ...
% (o, p1, p2, p3, Ntria, u , v , w, s1, m1, s2, m2, s3, m3)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Xuezhi Zheng, KU Leuven, xuezhi.zheng@esat.kuleuven.be
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz
