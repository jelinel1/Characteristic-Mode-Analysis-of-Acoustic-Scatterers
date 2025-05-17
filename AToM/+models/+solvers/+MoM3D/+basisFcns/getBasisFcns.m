%% getBasisFcns prepares basis functions for VJIE formulation
% This functions prepares basis functions for VJIE formulation. Three
% Cartesian (Jx,Jy,Jz) basis functions are assumed in every tehtrahedron.
%
% INPUTS
%  mesh: tetrahedral mesh structure, struct
%
% OUTPUTS
%  basisFunctions: basis-function structure for VJIE
%
% SYNTAX
%
%   [basisFunctions] = ...
%    models.solvers.MoM3D.basisFcns.getBasisFcns(mesh)
%
% (2018) Miloslav Capek, miloslav.capek@fel.cvut.cz
