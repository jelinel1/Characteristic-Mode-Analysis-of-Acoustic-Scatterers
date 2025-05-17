%% createProject creates a new project in AToM
% This function creates new project in Antenna Toolbox of Matlab (AToM). It is
% needed to set project name (also file name) and project type (default project
% type is MoM_F_2D).
%
%  INPUTS
%   rawProjectName: project name, string [1 x N]
%   projectType: project type, string [1 x N]
%
%  SYNTAX
%
%  createProject()
%
% open dialog window for setting location through GUI
%
%  createProject(rawProjectName)
%
% creates new project with default value projectType (MoM_F_2D). rawProjectName
% can be written as full file name (for example:
% d:\AToM\project\my_project.atom) or file name (my_project.atom) or also
% project name (my_project).
%
%  createProject(rawProjectName, projectType)
%
% creates new project with specification of projectType value (for example
% MoM_F_1D, MoM_F_2D). This value ensures to set correct tools in project. For
% example set solver using Method of Moments in frequency domain.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
