%% coordinates in u,v,w basis, see DOI: 10.1109/8.247786
% This function evaluates coordinates in u,v,w basis, see DOI: 10.1109/8.247786.
% Position vector is defined as r = u * u0 + v * v0 + w * w0 + p1.
%
% INPUTS
%  p1: triangle points, double [Ntria x 3]
%  o: observation point, double [1 x 3]
%  p3: triangle points, double [Ntria x 3]
%  u: basis vectors, double [Ntria x 3]
%  v: basis vectors, double [Ntria x 3]
%  w: basis vectors, double [Ntria x 3]
%  Ntria: number of triangles, integer [1 x 1]
%
% OUTPUTS
%  u0: coordinatges of o along u, double [Ntria x 3]
%  v0: coordinatges of o along v, double [Ntria x 3]
%  w0: coordinatges of o along w, double [Ntria x 3]
%
% SYNTAX
%
% [u0, v0, w0] = models.solvers.singularities.triaRWG.coordsUvWvalues(...
% o, p1, u, v, w, Ntria)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Xuezhi Zheng, KU Leuven, xuezhi.zheng@esat.kuleuven.be
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz
