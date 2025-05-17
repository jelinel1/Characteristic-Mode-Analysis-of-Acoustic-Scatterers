clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% add parametric Variable 
atom.selectedProject.workspace.addVariable('c', 1, 'my var')


%% create Points
atom.selectedProject.geom.addPoint( '[0, 0, 0]');
% vizualization of current Geom
fig = atom.selectedProject.geom.plot;

%% translate point 1 according to [1 1 0]
atom.selectedProject.geom.translateObject('Point1', '[1, 1, 0]', 'Point');
fig = atom.selectedProject.geom.plot(fig.Number);

%% rotate point 1 around line defined by points [-1 0 0; -1 1 0] about 180 deg
atom.selectedProject.geom.rotateObject('Point1', [-1 0 0; -1 1 0], pi);
fig = atom.selectedProject.geom.plot(fig.Number);

%% rotate point 1 around X-axis about 180 deg
atom.selectedProject.geom.rotateXObject('Point1', pi);
fig = atom.selectedProject.geom.plot(fig.Number);

%% rotate point 1 around Y-axis about 180 deg
atom.selectedProject.geom.rotateYObject('Point1', pi);
fig = atom.selectedProject.geom.plot(fig.Number);

%% rotate point 1 around Z-axis about -90 deg
atom.selectedProject.geom.rotateZObject('Point1', -pi/2);
fig = atom.selectedProject.geom.plot(fig.Number);

%% 
atom.selectedProject.geom.moveCommandObject('Point1', 1, 2);
atom.selectedProject.geom.removeCommandObject('Point1', 3);

%% reconstruct object with new properties, the object history is deleted
atom.selectedProject.geom.reconstructObject('Point1', 'coordVal', '[-7 7 0]');
fig = atom.selectedProject.geom.plot(fig.Number);

%% rename Point1 to MyPoint1
atom.selectedProject.geom.renameObject('Point1', 'MyPoint1', 'Point');

%%
atom.exit;