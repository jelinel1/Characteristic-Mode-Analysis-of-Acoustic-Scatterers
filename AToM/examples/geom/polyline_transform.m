clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

%% create points of PolyLine
x = [1; 2; 3; 4; 5; 6];
y = [1; -1; 1; 1; 2; 0];
z = zeros(size(x, 1),1);
points = [x,y,z];

%% add parametric Variable 
atom.selectedProject.workspace.addVariable('c', 1)

%% create PolyLine
atom.selectedProject.geom.addPolyLine(points);
fig = atom.selectedProject.geom.plot;

%% translate PolyLine1 according to [0 c 0]
atom.selectedProject.geom.translateObject('PolyLine1', '[0 c 0]');
fig = atom.selectedProject.geom.plot();

%% rotate PolyLine1 around line defined by points [-1 0 0; -1 1 0] about 180deg
atom.selectedProject.geom.rotateObject('PolyLine1', '[-1 0 0;-1 1 0]', pi);
fig = atom.selectedProject.geom.plot();

%% rotate PolyLine1 around X-axis about 180 deg
atom.selectedProject.geom.rotateXObject('PolyLine1', pi);
fig = atom.selectedProject.geom.plot();

%% rotate PolyLine1 around Y-axis about 180 deg
atom.selectedProject.geom.rotateYObject('PolyLine1', pi);
fig = atom.selectedProject.geom.plot();

%% rotate PolyLine1 around Z-axis about -90 deg
atom.selectedProject.geom.rotateZObject('PolyLine1', -pi/2);
fig = atom.selectedProject.geom.plot();

%% scale according to [2 0.5 1]
atom.selectedProject.geom.scaleObject('PolyLine1', [2, 0.5, 1]);
fig = atom.selectedProject.geom.plot();

%% change variable c
atom.selectedProject.workspace.editExpression('c', '2');
fig = atom.selectedProject.geom.plot();

%% reconstruct object with new properties, the object history is deleted
atom.selectedProject.geom.reconstructObject('PolyLine1', ...
   'points', points(2:end-1, :));
fig = atom.selectedProject.geom.plot();

%% clear geom and atom
atom.exit;