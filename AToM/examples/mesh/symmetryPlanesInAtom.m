clear all; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create Ellipses
atom.selectedProject.geom.addEllipse(...
   [0 0 0], [20 0 0], [0 10 0], 0, pi/2);

%% mesh
densityFunction = '@(x, y) ones(size(x, 1),1)';
atom.selectedProject.mesh.setGlobalDensityFunction( densityFunction );
atom.selectedProject.mesh.setGlobalMeshDensity(0.2);
atom.selectedProject.physics.symmetryPlanes.XZ.setType('magnetic');
atom.selectedProject.physics.symmetryPlanes.YZ.setType('magnetic');
atom.selectedProject.mesh.getMesh;
data = atom.selectedProject.mesh.getMeshData2D;

%% vizualization
atom.selectedProject.mesh.plotMesh;

%% end session
atom.exit;