%% evaluates quandrature points and weights for supplied triangles
% This function evaluates quandrature points and weights for supplied triangles.
%
% INPUTS
%  nQuad: quadrature order, integer (1-12) [1 x 1]
%  p1: triangle points, double [Ntria x 3]
%  p2: triangle points, double [Ntria x 3]
%  p3: triangle points, double [Ntria x 3]
%
% OUTPUTS
%  x: triangular quadrature points, double [Ntria x Nquadpoints]
%  y: triangular quadrature points, double [Ntria x Nquadpoints]
%  z: triangular quadrature points, double [Ntria x Nquadpoints]
%  weights: quadrature weights, double [Nquadpoints x 1]
%  Nquadpoints: number of quadrature points, integer [1 x 1]
%  Ntria: number of triangles, integer [1 x 1]
%
% SYNTAX
%
% [x, y, z, weights, Nquadpoints, Ntria] = ...
%  models.solvers.singularities.quadrature.triaQuad(p1, p2, p3, nQuad);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz
