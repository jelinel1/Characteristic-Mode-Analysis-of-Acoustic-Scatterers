%% closeProject closes opened AToM project
% This method allow to close any opened project in AToM instance. Closing more
% projects is possible using closeProject without inputs or enumerate chosen
% projects in cell array
%
%  INPUTS
%   rawProjectName: project name, string [1 x N]
%                   projects name, cell array of strings [1 x N], [N x 1]
%
%  SYNTAX
%
%  closeProject()
%
% When the method is called without any inputs, all projects in AToM instance
% will be closed. (Note: 'quit' method uses this way.)
%
%  closeProject(rawProjectName)
%
% Using the method with 'rawProjectName' input as a string then one project will
% be closed. If 'rawProjectName' will be cell array of strings with names of
% opened projects, AToM will close those projects
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
