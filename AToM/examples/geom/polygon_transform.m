clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

%% create points of Polygon
temp1 = importdata('czech_rep.txt');
points = [temp1, zeros(size(temp1, 1), 1)];

%% add parametric Variable 
atom.selectedProject.workspace.addVariable('c', 1)

%% create Polygon
atom.selectedProject.geom.addPolygon(points);
fig = atom.selectedProject.geom.plot;

%% translate Polygon according to [0 c 0]
atom.selectedProject.geom.translateObject('Polygon1', '[0 c 0]');
fig = atom.selectedProject.geom.plot();

%% rotate Polygon around line defined by points [-1 0 0; -1 1 0] about 180deg
atom.selectedProject.geom.rotateObject('Polygon1', '[-1 0 0;-1 1 0]', pi);
fig = atom.selectedProject.geom.plot();

%% rotate Polygon around X-axis about 180 deg
atom.selectedProject.geom.rotateXObject('Polygon1', pi);
fig = atom.selectedProject.geom.plot();

%% rotate Polygon around Y-axis about 180 deg
atom.selectedProject.geom.rotateYObject('Polygon1', pi);
fig = atom.selectedProject.geom.plot();

%% rotate Polygon around Z-axis about -90 deg
atom.selectedProject.geom.rotateZObject('Polygon1', -pi/2);
fig = atom.selectedProject.geom.plot();

%% scale according to [2 0.5 1]
atom.selectedProject.geom.scaleObject('Polygon1', [2, 0.5, 1]);
fig = atom.selectedProject.geom.plot();

%% change variable c
atom.selectedProject.workspace.editExpression('c', '200');
fig = atom.selectedProject.geom.plot();

%% reconstruct object with new properties, the object history is deleted
atom.selectedProject.geom.reconstructObject('Polygon1', ...
   'points', [0 0 0; 500 0 0; 500 200 0; 0 200 0; 0 0 0]);
fig = atom.selectedProject.geom.plot();

%% clear geom and atom
atom.exit;