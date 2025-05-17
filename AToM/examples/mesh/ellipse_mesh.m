clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create Ellipses
atom.selectedProject.geom.addEllipse(...
   [0 0 0], [20 0 0], [0 10 0], 0, pi);

%% mesh
maxElement = 1;
atom.selectedProject.mesh.setMaxElement('Ellipse1', maxElement);
meshSize = 0.01;
atom.selectedProject.mesh.setLocalMeshDensity('Ellipse1', meshSize);
atom.selectedProject.mesh.setUseLocalMeshDensity('Ellipse1', true);
densityFunction = '@(x, y) ones(size(x, 1),1)';
atom.selectedProject.mesh.setLocalDensityFunction('Ellipse1', densityFunction);
atom.selectedProject.mesh.getMesh;

%% vizualization
atom.selectedProject.mesh.plotMesh;
atom.selectedProject.save;

%% end session
atom.exit;