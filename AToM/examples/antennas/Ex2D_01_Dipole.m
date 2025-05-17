%% Create a strip dipole and mesh
clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

%% create variables
atom.selectedProject.workspace.addVariable('L', 1, 'dipole length')
atom.selectedProject.workspace.addVariable('W', 'L/50', 'dipole width')

%% create Objects
atom.selectedProject.geom.addParallelogram('[-L/2, -W/2, 0] ', ...
   '[L/2, -W/2, 0]', '[-L/2, W/2, 0]', 'Rectangle');
% fig = atom.selectedProject.geom.plot;

%% create Mesh
% set MeshDensity and MeshQuality
atom.selectedProject.physics.setFrequencyList('50e6:10e6:300e6');
atom.selectedProject.mesh.setUseLocalMeshDensity( 'Rectangle', true);
atom.selectedProject.mesh.setLocalMeshDensity('Rectangle',20);

atom.selectedProject.mesh.getMesh;
atom.selectedProject.mesh.plotMesh;

%% end session
atom.exit