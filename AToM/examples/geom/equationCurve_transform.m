clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% add parametric Variable 
atom.selectedProject.workspace.addVariable('c', 1, 'my var')

%% create EquationCurve
atom.selectedProject.geom.addEquationCurve('@(t) sin(t) + 1', ...
   '@(t) t - 2', '@(t) 0*t', [0 2*pi]);
fig = atom.selectedProject.geom.plot;

%% translate EequationCurve 1 according to [0 c 0]
atom.selectedProject.geom.translateObject('EquationCurve1', '[0 c 0]');
fig = atom.selectedProject.geom.plot();

%% rotate EequationCurve 1 around line defined by Point [-1 0 0; -1 1 0] 180 deg
atom.selectedProject.geom.rotateObject('EquationCurve1', ...
   '[-1 0 0;-1 1 0]', pi);
fig = atom.selectedProject.geom.plot();

%% rotate EequationCurve 1 around X-axis about 180 deg
atom.selectedProject.geom.rotateXObject('EquationCurve1', pi);
fig = atom.selectedProject.geom.plot();

%% rotate EequationCurve 1 around Y-axis about 180 deg
atom.selectedProject.geom.rotateYObject('EquationCurve1', pi);
fig = atom.selectedProject.geom.plot();

%% rotate EequationCurve 1 around Z-axis about -90 deg
atom.selectedProject.geom.rotateZObject('EquationCurve1', -pi/2);
fig = atom.selectedProject.geom.plot();

%% scale according to [2 0.5 1]
atom.selectedProject.geom.scaleObject('EquationCurve1', [2, 0.5, 1]);
fig = atom.selectedProject.geom.plot();

%% change variable c
atom.selectedProject.workspace.editExpression('c', '2');
fig = atom.selectedProject.geom.plot();

%% reconstruct object with new properties, the object history is deleted
atom.selectedProject.geom.reconstructObject('EquationCurve1', ...
   'equationX', '@(t) t.^2', ...
   'paramInterval', [-1 1]);
fig = atom.selectedProject.geom.plot(fig.Number);

atom.selectedProject.geom.reconstructObject('EquationCurve1', ...
   'equationX', '@(t) sin(t)', ...
   'equationY', '@(t) cos(t) + 1', ...
   'equationZ', '@(t) 0*t', ...
   'paramInterval', [-1 1]);

%% clear atom and geom
atom.exit;