clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create Ellipse
atom.selectedProject.geom.addEllipse([0 0 0], [20 0 0], [0 10 0], 0, pi);
atom.selectedProject.geom.addLine([0 0 0; 20 0 0], 'Line1');

%% mesh
meshSize = 0.2; 
atom.selectedProject.mesh.setLocalMeshDensity('Ellipse1', meshSize);
atom.selectedProject.mesh.setLocalMeshDensity('Line1', meshSize);
densityFunction = '@(x, y) ones(size(x, 1),1)';
atom.selectedProject.mesh.setLocalDensityFunction('Ellipse1', densityFunction);
atom.selectedProject.mesh.setUseLocalMeshDensity('Line1', 1);
atom.selectedProject.mesh.setUseLocalMeshDensity('Ellipse1', 1);
atom.selectedProject.mesh.getMesh;
%% vizualization 1 
atom.selectedProject.mesh.plot('Line1');
atom.selectedProject.mesh.plotMesh;

%% delete elemets
atom.selectedProject.mesh.deleteNodes([4;22;39]);
atom.selectedProject.mesh.deleteEdges1D([1;2;4;7]);
atom.selectedProject.mesh.deleteTriangles([4;22;90]);

%% vizualization 2
close all
atom.selectedProject.mesh.plot('Line1');
atom.selectedProject.mesh.plotMesh;
atom.selectedProject.save;

%% end session
atom.exit;