%% selectProject selects project to property 'selectedProject'
% This function selects one project from projects list and sets AToM property
% 'selectedProject' by this selected project. There are two options, how to
% select project. First, using project name. Second, using project index.
%
%  INPUTS
%   rawProjectName: project name, string [1 x N]
%                   project index, double [1 x 1]
%
%  SYNTAX
%
%  selectProject(rawProjectName)
%
% Using 'rawProjectName' as "project name" from projects list or as "project
% index" (order of project) is possible to select project to AToM property
% 'selectedProject'.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
