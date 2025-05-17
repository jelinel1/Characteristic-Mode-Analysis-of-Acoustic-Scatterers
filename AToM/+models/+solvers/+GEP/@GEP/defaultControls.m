%% defaultControls provide struct of control handles for given inner solver
% Provide struct of control handles for given inner solver. Fields contains
% string with handles which are set to corresponding GEP propertis when
% solver is started.
%
%  INPUTS
%   innerSolver: name of inner solver, char [1 x N]
%
%  OUTPUTS
%   defControls: handles for controlling inner solver, struct [1 x 1]
%     .innerSolverHndl: get object of inner solver, char [1 x N]
%     .innerSolverSolve: solve inner solver, char [1 x N]
%     .innerSolverGetA: get matrix A from inner solver, char [1 x N]
%     .innerSolverGetB: get matrix B from inner solver, char [1 x N]
%     .innerSolverGetN: get matrix N from inner solver, char [1 x N]
%     .eigRunPreAndPostprocessing: run function before and after eig/eigs,
%                                                           logical [1 x 1]
%   eigPreprocessing: eig/eigs pre-processing, char [1 x N]
%   eigPostprocessing: eig/eigs post-processing, char [1 x N]
%
%  SYNTAX
%
%  defControls = objGEP.defaultControls(innerSolver)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Michal Masek, CTU in Prague, michal.masek@antennatoolbox.com
% mcode docu
