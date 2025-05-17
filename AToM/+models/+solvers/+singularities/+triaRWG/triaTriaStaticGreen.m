%% all tria-tria integrals neccesary for RWG MoM - static part
% This functions evaluates all tria-tria integrals neccesary for a static part
% of RWG MoM. Following integrals are evaluated:
%
% Integrate[ Integrate[ (ro dot rs)/R ] ] / (AreaO * AreaS)
% Integrate[ Integrate[ xo/R ] ] / (AreaO * AreaS)
% Integrate[ Integrate[ yo/R ] ] / (AreaO * AreaS)
% Integrate[ Integrate[ zo/R ] ] / (AreaO * AreaS)
% Integrate[ Integrate[ 1/R ] ] / (AreaO * AreaS)
%
% Careful,
% Integrate[ Integrate[ xo/R ] ] / (AreaO * AreaS)
% Integrate[ Integrate[ yo/R ] ] / (AreaO * AreaS)
% Integrate[ Integrate[ zo/R ] ] / (AreaO * AreaS)
% are not symmetric.
%
% INPUTS
%  nQuad: quadrature order, integer (1-12) [1 x 1]
%  p1: triangle points, double [Ntria x 3]
%  p2: triangle points, double [Ntria x 3]
%  p3: triangle points, double [Ntria x 3]
%  TriaArea: triangle areas, double [Ntria x 1]
%  waitBar: AToM waitbar object
%
% OUTPUTS
%  ITT1: matrix of integrals, double [Ntria x Ntria]
%  ITT2x: matrix of integrals, double [Ntria x Ntria]
%  ITT2y: matrix of integrals, double [Ntria x Ntria]
%  ITT2z: matrix of integrals, double [Ntria x Ntria]
%  ITT3: matrix of integrals, double [Ntria x Ntria]
%
% SYNTAX
%
%   [ITT1, ...
%    ITT2x, ...
%    ITT2y, ...
%    ITT2z, ...
%    ITT3] = ...
%    models.solvers.singularities.triaRWG.triaTriaStaticGreen ...
%    (nQuad, p1, p2, p3, TriaArea, waitBar);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz
