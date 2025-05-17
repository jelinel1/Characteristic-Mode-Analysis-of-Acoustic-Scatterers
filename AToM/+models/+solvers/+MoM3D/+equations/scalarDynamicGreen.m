%% calculates dynamic part of free-space Green's function
% This function calculates dynamic part of free-space Green's function
% G = (exp(-1i*k*R) - 1)/R
%
% INPUTS:
%         k: wavenumber, double [1 x 1]
%  x1,y1,z1: source points, double [M x N]
%  x2,y2,z2: observation points, double [M x N]
%
% OUTPUTS:
%    OUT: values of Green's function, double [M x N]
%
% SYNTAX
%
% [integral_tria_tria] = ...
% models.solvers.MoM3D.equations.scalarDynamicGreen(k, x1, y1, z1, ...
% x2, y2, z2)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com
% mcode
