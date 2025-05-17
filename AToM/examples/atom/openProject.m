%% openProject EXAMPLE: How to open project in AToM
% Already exist project is possible open by the same way as creating new
% project or closing opened project. There are four options how to do that.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
clear;close all;clc

%% Preparing project file
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'at');
[folder, onlyName, ext] = fileparts(fileName);

% initialization of AToM
at = Atom.initialize(false);
% craeting of project
at.createProject(fileName)
% setting some variable
at.selectedProject.workspace.addVariable('a',5)
at.selectedProject.save
% closing of Atom
at.exit

%% 1.) only project name (for example 'dipole')
at = Atom.initialize(false);
at.openProject(onlyName)
workspaceTable = at.selectedProject.workspace.table;
display(workspaceTable)
at.exit

%% 2.) file name (for example 'dipole.atom')
at = Atom.initialize(false);
at.openProject([onlyName, '.atom'])
workspaceTable = at.selectedProject.workspace.table;
display(workspaceTable)
at.exit

% This is option how to opened project file from user's choosen path.
at = Atom.initialize(false);
at.openProject(fileName);
workspaceTable = at.selectedProject.workspace.table;
display(workspaceTable)
at.exit

%% 3.) through GUI
% Full project location of opening project can be select through GUI
at = Atom.initialize(false);
at.openProject();
workspaceTable = at.selectedProject.workspace.table;
display(workspaceTable);
at.exit