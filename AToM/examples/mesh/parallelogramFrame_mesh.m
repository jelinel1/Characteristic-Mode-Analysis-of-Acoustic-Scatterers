clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create ParallelogramFrame
atom.selectedProject.geom.addParallelogramFrame([0, 0, 0], ...
   [2, 0, 0], [1 1 0]);
atom.selectedProject.geom.addParallelogramFrame([3 3 0], [4 3 0], ...
   [3 4 0]);
atom.selectedProject.geom.addParallelogramFrame([0 -2 -2], ...
   [0 -4 -2], [0 -3 -3]);

%% mesh
atom.selectedProject.mesh.setGlobalMeshDensity(2);
atom.selectedProject.mesh.getMesh();

%% vizualization
atom.selectedProject.mesh.plot;

%% end session
atom.exit;