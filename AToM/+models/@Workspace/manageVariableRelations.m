%% manageVariableRelations ensure consistent content of adjacency matrix.
% This method is called alwazs when is some variable changes in way, which has
% influence on adjacency matrix.
% Only instances of Workspace class can call this method.
%
%  INPUTS
%   variable: instance of Variable class, which was added, edited or deleted,
%             Function is also called from the constructor of Workspace
%             and in that case, all variables from list are in variable input.
%             Variable [1 x 1] or [n x 1]
%   taskDescr: description of task, char [n x 1]
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
