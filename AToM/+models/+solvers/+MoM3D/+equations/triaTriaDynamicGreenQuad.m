%% calculates all tria-tria integrals neccesary for Zvac - dynamic part
% This function calculates all tria-tria integrals neccesary for dynamic
% part of Zvac
%
% INPUTS:
%    nQuad: quadrature order, double [1 x 1]
%       p1: triangle points, double [Ntria x 3]
%       p2: triangle points, double [Ntria x 3]
%       p3: triangle points, double [Ntria x 3]
% TriaArea: triangle areas, double [Ntria x 1]
%  waitBar: AToM waitbar object
%
% OUTPUTS:
%    integral_tria_tria: matrix of integrals, double [Ntria x Ntria]
%
% SYNTAX
%
% [integral_tria_tria] = ...
% models.solvers.MoM3D.equations.triaTriaDynamicGreenQuad(k, nQuad,...
% p1, p2, p3, TriaArea);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Lukas Jelinek, CTU in Prague, lukas.jelinek@antennatoolbox.com
% mcode
