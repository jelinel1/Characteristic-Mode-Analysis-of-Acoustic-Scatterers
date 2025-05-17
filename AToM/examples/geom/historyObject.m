clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% add parametric Variable 
atom.selectedProject.workspace.addVariable('c', 1, 'my var')

%% create Line
atom.selectedProject.geom.addLine( '[1, 1, 0; 2, 2 0]');
% vizualization of current Geom
fig = atom.selectedProject.geom.plot;

%% manipulate with object
atom.selectedProject.geom.translateObject('Line1', '[2, 0, 0]');
atom.selectedProject.geom.rotateObject('Line1', [-1 0 0; -1 1 0], pi);
atom.selectedProject.geom.rotateXObject('Line1', pi);
fig = atom.selectedProject.geom.plot;
objHistory = atom.selectedProject.geom.line(1).history.commands;

%% make rotate as first and recompute object
atom.selectedProject.geom.moveCommandObject('Line1', 2, 1);
fig = atom.selectedProject.geom.plot(fig.Number);
objHistory = atom.selectedProject.geom.line(1).history.commands

%% delete rotateX from history, perform just rotate and tranlate
atom.selectedProject.geom.removeCommandObject('Line1', 3);
fig = atom.selectedProject.geom.plot(fig.Number);
objHistory = atom.selectedProject.geom.line(1).history.commands

%%
atom.exit;