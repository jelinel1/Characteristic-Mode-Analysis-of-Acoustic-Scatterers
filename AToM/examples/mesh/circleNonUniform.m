clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create Ellipses
atom.selectedProject.geom.addEllipse([0 0 0], [0.3 0 0], [0 0.3 0], 0, 2*pi);

%% mesh
atom.selectedProject.mesh.setGlobalMeshDensity(3);
densityFunction = '@(x, y) max(5*sqrt(x.*x + y.*y) .* ones(size(x, 1),1), 0.1)';
atom.selectedProject.mesh.setGlobalDensityFunction(densityFunction);
atom.selectedProject.mesh.getMesh;

%% vizualization
atom.selectedProject.mesh.plotMesh;

%% end session
atom.exit;