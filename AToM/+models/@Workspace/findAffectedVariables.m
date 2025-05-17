%% findAffectedVariables finds indices of affected variables.
% This method finds indices of all variables from workspace.list which are
% affected by editing/deleting of some variable.
% Only instances of Workspace class can call this method.
%
%  INPUTS
%   varsLogInd: logical indices of edited/deleted/added variable(s) in
%               workspace.list, logical [n x 1]
%
%  OUTPUTS
%   affectedVarsInd: indices of all variables, which are affected by
%                    editing/deleting variable(s) from varsInd, duble [n x 1]
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
