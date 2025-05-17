%% Creates static zMatE0 and zMatM0 matrices for RWG MoM
% This function evaluates electric and magnetic static part of impedance matrix.
% First integration in reaction integrals is made analytically and
% provides singularity treatment.
%
% INPUTS
%  mesh: AToM stucture containing mesh
%  basisFcns: AToM stucture containing basis functions
%  nQuad: quadrature order, integer (1-12) [1 x 1]
%  verbosity: amount of information shown, integer (0,1,2,3) [1 x 1]
%  waitBar: AToM waitbar object
