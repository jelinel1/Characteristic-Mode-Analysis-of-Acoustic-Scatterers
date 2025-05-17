clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(true);
atom.createProject(fileName);

%% create Parallelograms
atom.selectedProject.geom.addParallelogram([0, 0, 0], ...
   [10, 0, 0], [5 5 0]);
atom.selectedProject.geom.addParallelogram([0 -2 -2], ...
   [1 -10 -12], [5 -7 -6]);

%% mesh
atom.selectedProject.mesh.setGlobalMeshDensity(0.4);
atom.selectedProject.mesh.setUseUniformTriangulation( true );
% atom.selectedProject.mesh.setUniformMeshType('right');
atom.selectedProject.mesh.setUniformMeshType('equilateral');
atom.selectedProject.mesh.getMesh();

%% vizualization
atom.selectedProject.mesh.plotMesh;

%% end session
atom.exit;
