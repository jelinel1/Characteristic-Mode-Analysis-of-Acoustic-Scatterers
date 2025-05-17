%% unit vectors of coordinate system s,m, see DOI: 10.1109/8.247786
% This function evaluates unit vectors of coordinate system s,m,
% see DOI: 10.1109/8.247786. Variable s is a unit vector along a triangle edge
% (counter-clockwise orientation ),
% s_i = ( p_(i-1) - p_(i+1) ) / | p_(i-1) - p_(i+1) |,
% m = s x w
%
% INPUTS
%  p1: triangle points, double [Ntria x 3]
%  p2: triangle points, double [Ntria x 3]
%  p3: triangle points, double [Ntria x 3]
%  w: unit vector of u,v,w basis, double [Ntria x 3]
%
% OUTPUTS
%  s1: basis vectors, double [Ntria x 3]
%  s2: basis vectors, double [Ntria x 3]
%  s3: basis vectors, double [Ntria x 3]
%  m1: basis vectors, double [Ntria x 3]
%  m2: basis vectors, double [Ntria x 3]
%  m3: basis vectors, double [Ntria x 3]
%
% SYNTAX
%
% [s1, m1, s2, m2, s3, m3] = ...
%    models.solvers.singularities.triaRWG.coordsSmBasis(p1, p2, p3, w)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Xuezhi Zheng, KU Leuven, xuezhi.zheng@esat.kuleuven.be
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz
