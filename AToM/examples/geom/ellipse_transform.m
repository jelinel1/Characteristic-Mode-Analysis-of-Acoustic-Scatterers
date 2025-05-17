clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% add parametric Variable 
atom.selectedProject.workspace.addVariable('c', 1, 'my var')

%% create Ellipse
atom.selectedProject.geom.addEllipse(...
   [0 0 0], [2 0 0], [0 1 0], 0, pi);
fig = atom.selectedProject.geom.plot;

%% translate Elipse1 according to [0 c 0]
atom.selectedProject.geom.translateObject('Ellipse1', '[0 c 0]');
fig = atom.selectedProject.geom.plot();

%% rotate Elipse1 around line defined by points [-1 0 0; -1 1 0] about 180deg
atom.selectedProject.geom.rotateObject('Ellipse1', '[-1 0 0;-1 1 0]', pi);
fig = atom.selectedProject.geom.plot();

%% rotate Elipse1 around X-axis about 180 deg
atom.selectedProject.geom.rotateXObject('Ellipse1', pi);
fig = atom.selectedProject.geom.plot();

%% rotate Elipse1 around Y-axis about 180 deg
atom.selectedProject.geom.rotateYObject('Ellipse1', pi);
fig = atom.selectedProject.geom.plot();

%% rotate Elipse1 around Z-axis about -90 deg
atom.selectedProject.geom.rotateZObject('Ellipse1', -pi/2);
fig = atom.selectedProject.geom.plot();

%% scale according to [2 0.5 1]
atom.selectedProject.geom.addEllipse(...
   [0 0 0], [2 0 0], [0 1 0], 0, pi);
atom.selectedProject.geom.scaleObject('Ellipse2', [2, 0.5, 1]);
fig = atom.selectedProject.geom.plot();

%% change variable c
atom.selectedProject.workspace.editExpression('c', '2');
fig = atom.selectedProject.geom.plot();

%% reconstruct object with new properties, the object history is deleted
atom.selectedProject.geom.reconstructObject('Ellipse1', ...
   'center', [1 2 2], ...
   'majorVertex', [3 2 2], ...
   'minorVertex', [1 3 2]);
fig = atom.selectedProject.geom.plot();

%% clear geom and atom
atom.exit;