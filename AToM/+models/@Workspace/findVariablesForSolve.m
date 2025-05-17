%% findVariablesForSolve finds variables needed for solve another variables.
% This methods finds indices of variabes in workspace.list. When is some
% variable edited/added/deleted we need to know, which variables are necessary
% for evaluation of the new/edited variable.
% Only instances of Workspace class can call this method.
%
%  INPUTS
%   varsLogInd: logical indices of edited/deleted/added variable(s) in
%               workspace.list which has to be evaluated, logical [n x 1]
%
%  OUTPUTS
%   varsForEval: all variables, which are neccesary for evaluation
%                of variables pointed in varsLogInd, double [n x 1]
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
