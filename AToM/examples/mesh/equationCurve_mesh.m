clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create EquationCurve
atom.selectedProject.geom.addEquationCurve(...
   '@(t) sin(t) + 1', '@(t) t - 2', '@(t) 0*t', [0 2*pi]);
atom.selectedProject.geom.addEquationCurve('@(t) t.^3', '@(t) t', ...
   '@(t) 0*t', [-2 2]);

%% mesh
atom.selectedProject.mesh.setGlobalMeshDensity(1);
atom.selectedProject.mesh.getMesh();

%% vizualization
atom.selectedProject.mesh.plot;

%% end session
atom.exit;
