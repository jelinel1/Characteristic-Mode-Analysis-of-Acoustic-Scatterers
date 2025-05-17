%% all tria-tria integrals neccesary for Tetrahedral PWC MoM - static part
% This functions evaluates all tria-tria integrals neccesary for a static part
% of Tetrahedral PWC MoM. Following integrals are evaluated:
%
% Integrate[ Integrate[ 1/(4*pi*R) ] ]
%
% This is a simplified version of function
% models.solvers.singularities.triaRWG.triaTriaStaticGreen
%
% INPUTS
%  nQuad: quadrature order, integer (1-12) [1 x 1]
%  p1: triangle points, double [Ntria x 3]
%  p2: triangle points, double [Ntria x 3]
%  p3: triangle points, double [Ntria x 3]
%  TriaArea: triangle areas, double [Ntria x 1]
%  waitBar: AToM waitbar object
%  verbosity: >= 1 --> report, 0 --> do not report
%
% OUTPUTS
%  integralTriaTria: matrix of integrals, double [Ntria x Ntria]
%
% SYNTAX
%
%   [integralTriaTria] = ...
%    models.solvers.singularities.tetraPWC.triaTriaStaticGreen ...
%    (nQuad, p1, p2, p3, TriaArea, waitBar, verbosity);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2019, Lukas Jelinek, CTU in Prague, lukas.jelinek@fel.cvut.cz
