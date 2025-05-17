clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create geometry
atom.selectedProject.geom.addParallelogram('[-1/2 -1/2 0]', '[1/2 -1/2 0]', ...
   '[-1/2 1/2 0]', 'Parallelogram1');
atom.selectedProject.geom.scaleObject('Parallelogram1', '[4 1 1]');
atom.selectedProject.geom.copyObject('Parallelogram1', [0 2 0], 1);

%% create mesh
atom.selectedProject.mesh.setUseUniformTriangulation(true);
atom.selectedProject.mesh.setUniformMeshType('right');
atom.selectedProject.mesh.setGlobalMeshDensity('1');
atom.selectedProject.mesh.getMesh();

%% get circumsphere
mesh = atom.selectedProject.mesh;
[coordinates] = atom.selectedProject.mesh.getCircumsphere(true);

%% plot data
atom.selectedProject.mesh.plotMeshCircumsphere();

%% end session
atom.exit;