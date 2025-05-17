clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% add parametric Variable 
atom.selectedProject.workspace.addVariable('c', 1, 'my var');

%% create Lines
atom.selectedProject.geom.addLine('[1, 1, 1; 2, 0, 0]');
atom.selectedProject.geom.addLine([1, 1, 1; 0, 1, 0]);
atom.selectedProject.geom.addLine('[c, 1, 0; c+2, 1 0]');

%% mesh
atom.selectedProject.mesh.getMesh();

%% vizualization
atom.selectedProject.mesh.plot;

%% end session
atom.exit;