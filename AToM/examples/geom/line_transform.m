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
atom.selectedProject.geom.addLine( '[c, 1, 0; c+2, 1 0]');
% vizualization of current Geom
fig = atom.selectedProject.geom.plot;

%% translate point 1 according to [1 1 0]
atom.selectedProject.geom.translateObject('Line1', '[1, 1, 0]');
fig = atom.selectedProject.geom.plot(fig.Number);

%% rotate point 1 around line defined by points [-1 0 0; -1 1 0] about 180 deg
atom.selectedProject.geom.rotateObject('Line1', [-1 0 0; -1 1 0], pi);
fig = atom.selectedProject.geom.plot(fig.Number);

%% rotate point 1 around X-axis about 180 deg
atom.selectedProject.geom.rotateXObject('Line1', pi);
fig = atom.selectedProject.geom.plot(fig.Number);

%% rotate point 1 around Y-axis about 180 deg
atom.selectedProject.geom.rotateYObject('Line1', pi);
fig = atom.selectedProject.geom.plot(fig.Number);

%% rotate point 1 around Z-axis about -90 deg
atom.selectedProject.geom.rotateZObject('Line1', -pi/2);
fig = atom.selectedProject.geom.plot(fig.Number);

%% reconstruct object with new properties, the object history is deleted
atom.selectedProject.geom.reconstructObject('Line1', ...
   'points', '[-2 1 0; 2 -1 0]');
fig = atom.selectedProject.geom.plot(fig.Number);

%%
atom.exit;