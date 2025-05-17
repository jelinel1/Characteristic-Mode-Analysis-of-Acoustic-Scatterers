clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% add parametric Variable 
atom.selectedProject.workspace.addVariable('c', 1, 'my var')

%% create EllipseArc
atom.selectedProject.geom.addParallelogram([0 0 0], [2 0 0], ...
   '[1 c 0]');
fig = atom.selectedProject.geom.plot;

%% translate point 1 according to [0 c 0]
atom.selectedProject.geom.translateObject('Parallelogram1', '[0 c 0]', ...
   'Parallelogram');
fig = atom.selectedProject.geom.plot();

%% rotate point 1 around line defined by points [-1 0 0; -1 1 0] about 180 deg
atom.selectedProject.geom.rotateObject('Parallelogram1', ...
   '[-1 0 0;-1 1 0]', pi);
fig = atom.selectedProject.geom.plot();

%% rotate point 1 around X-axis about 180 deg
atom.selectedProject.geom.rotateXObject('Parallelogram1', pi);
fig = atom.selectedProject.geom.plot();

%% rotate point 1 around Y-axis about 180 deg
atom.selectedProject.geom.rotateYObject('Parallelogram1', pi);
fig = atom.selectedProject.geom.plot();

%% rotate point 1 around Z-axis about -90 deg
atom.selectedProject.geom.rotateZObject('Parallelogram1', -pi/2);
fig = atom.selectedProject.geom.plot();

%% scale according to [2 0.5 1]
atom.selectedProject.geom.scaleObject('Parallelogram1', [2, 0.5, 1]);
fig = atom.selectedProject.geom.plot();

%% change variable c
atom.selectedProject.workspace.editExpression('c', '2');
fig = atom.selectedProject.geom.plot();

%% reconstruct object with new properties, the object history is deleted
atom.selectedProject.geom.reconstructObject('Parallelogram1', ...
   'lowLeftCorner', '[-2 0 0]');
fig = atom.selectedProject.geom.plot(fig.Number);

%%
atom.exit;