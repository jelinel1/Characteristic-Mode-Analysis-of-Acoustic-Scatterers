clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create Ellipse
atom.selectedProject.geom.addEllipse(...
   [0 0 0], [20 0 0], [0 20 0], 0, pi);

%% mesh
meshSize = 0.1; 
atom.selectedProject.mesh.setLocalMeshDensity( 'Ellipse1', meshSize );
atom.selectedProject.mesh.setUseLocalMeshDensity( 'Ellipse1', 1 );
atom.selectedProject.mesh.getMesh;
atom.selectedProject.mesh.plotMesh;

%% symmetry computation
[nodes, connectivityList] = models.utilities.meshPublic.symmetrizeMesh(atom. ...
   selectedProject.mesh.nodes, atom.selectedProject.mesh. ...
   elements2D.connectivityList, [0 0 0; 1 0 0; -1 1 1]);

[nodes, connectivityList] = models.utilities.meshPublic.symmetrizeMesh(nodes, ...
   connectivityList, [0 0 0; 1 0 0; -1 -1 1]);

[nodes, connectivityList] = models.utilities.meshPublic.symmetrizeMesh(nodes, ...
   connectivityList, [0 0 0; 1 0 0; -1 -12 5]);

%% visualization
mesh = models.utilities.meshPublic.getMeshData2D(nodes, connectivityList);
results.plotMesh(mesh);

%% end session
atom.exit;