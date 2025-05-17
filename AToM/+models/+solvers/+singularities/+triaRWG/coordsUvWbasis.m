%% unit vectors of coordinate system u,v,w, see DOI: 10.1109/8.247786
% This function evaluates unit vectors of coordinate system u,v,w,
% see DOI: 10.1109/8.247786.
% Cartesian coordinate system is placed with an origin at p1, where u is
% along p2 - p1 and w is normal to the triangle (mathematical sense when going
% along 1,2,3). Position vector r = u * u0 + v * v0 + w * w0 + p1.
%
% INPUTS
%  p1: triangle points, double [Ntria x 3]
%  p2: triangle points, double [Ntria x 3]
%  p3: triangle points, double [Ntria x 3]
%  TriaArea: triangle areas, double [Ntria x 1]
%
% OUTPUTS
%  u: basis vectors, double [Ntria x 3]
%  v: basis vectors, double [Ntria x 3]
%  w: basis vectors, double [Ntria x 3]
%
% SYNTAX
%
% [u, v, w] = models.solvers.singularities.triaRWG.coordsUvWbasis ...
% (p1, p2, p3, TriaArea)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Xuezhi Zheng, KU Leuven, xuezhi.zheng@esat.kuleuven.be
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz
