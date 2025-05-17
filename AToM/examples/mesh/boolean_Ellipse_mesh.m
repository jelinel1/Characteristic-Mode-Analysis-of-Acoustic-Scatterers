clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create geometry
atom.selectedProject.geom.addEllipse([-3 2 0], ...
   [-1 2 0], [-3 3 0], 0, pi);
atom.selectedProject.geom.addParallelogram([-3.5 1 0], ...
   [-2.5 1 0], [-3.0 3.1 0]);
atom.selectedProject.geom.addParallelogram([-4 2.1 0], ...
   [-3.9 2.1 0], [-3.9 2.2 0]);
atom.selectedProject.geom.addParallelogram([-4.5 2.5 0], ...
   [-4.3 2.5 0], [-4.3 2.7 0]);
atom.selectedProject.geom.boolean.subtract('Ellipse1', 'Parallelogram1');
atom.selectedProject.geom.boolean.subtract('Ellipse1', 'Parallelogram2');
atom.selectedProject.geom.boolean.subtract('Ellipse1', 'Parallelogram3');

atom.selectedProject.geom.plot;

%% Mesh
atom.selectedProject.mesh.setGlobalMeshDensity(2.75);
atom.selectedProject.mesh.setGlobalDensityFunction('@(x,y) ones(size(x,1),1)');

atom.selectedProject.mesh.getMesh;
atom.selectedProject.mesh.plotMesh;

%% end session
atom.exit;