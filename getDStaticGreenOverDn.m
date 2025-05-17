function [DSoverDn] = getDStaticGreenOverDn(o, p1, p2, p3, Ntria, u , v , w, ...
    s1, m1, s2, m2, s3, m3)
%% Evaluates n \cdot \nabla 1/R on a triangle, see DOI: 10.1109/8.247786
% This function evaluates normal derivative of 1/R on a triangle for a 
% given observation point, see DOI: 10.1109/8.247786. Integration is made 
% analytically and provides singularity treatment. Normal belongs to the 
% source coordinate and \nabla refers to observation coordinates.
% 
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
%  DSoverDn: n \cdot \nabla 1/R, double [Ntria x 1]
%
% SYNTAX
% 
% [DSoverDn] = getDStaticGreenOverDn(o, p1, p2, p3, Ntria, u , v , w, ...
    % s1, m1, s2, m2, s3, m3)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2024, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz

% local coordinates (the u - v - w system)
[~, ~, w0] = ...
   models.solvers.singularities.triaRWG.coordsUvWvalues(o, p1, u, v, w, Ntria );

% local coordinates (the s - m - w system)
[s1n, s1p, s2n, s2p, s3n, s3p, t10, t20, t30, R10, R20, R30, R1n, R1p, R2n, ...
   R2p, R3n, R3p] = models.solvers.singularities.triaRWG.coordsSmValues( ...
   o, p1, p2, p3, s1, m1, s2, m2, s3, m3, w);

% n \cdot \nabla 1/R 
beta =  models.solvers.singularities.triaRWG.s01(s1n, s1p, s2n,...
   s2p, s3n, s3p, t10, t20, t30, w0, R10, R20, R30, R1n, R1p, R2n, R2p,...
   R3n, R3p);

% see Eq. 26 from 10.1109/8.247786
% There should be "DSoverDn = - sign(w0).*beta" even for the self-term, 
% but in this code it is assumed that the boundary condition is applied 
% just outside the surface, which means that sign(w0) = 1 when w0 approaches 0+.
DSoverDn = - sign(w0).*beta;
ind = abs(w0) < 100*eps;
DSoverDn(ind) = - beta(ind);


end