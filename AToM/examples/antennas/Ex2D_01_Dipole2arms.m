%% Create a strip dipole from two arms, unite them and mesh
clc; close all; clear all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

%% create variables
atom.selectedProject.workspace.addVariable('L1', 1/2, 'dipole arm1 length')
atom.selectedProject.workspace.addVariable('L2', 1/2, 'dipole arm2 length')
atom.selectedProject.workspace.addVariable('W', '(L1+L2)/50', 'dipole width')

%% create Objects
 atom.selectedProject.geom.addParallelogram('[-L1, -W/2, 0] ', ...
    '[0, -W/2, 0]', '[-L1, W/2, 0]', 'arm1');
 atom.selectedProject.geom.addParallelogram('[0, -W/2, 0] ', ...
    '[L2, -W/2, 0]', '[0, W/2, 0]', 'arm2');

fig = atom.selectedProject.geom.plot;
atom.selectedProject.geom.boolean.unite('arm1', 'arm2');
fig = atom.selectedProject.geom.plot;

%% create Mesh
% set MeshSize and MeshQuality
atom.selectedProject.physics.setFrequencyList('50e6:10e6:300e6');
atom.selectedProject.mesh.setUseLocalMeshDensity( 'arm1', true);
atom.selectedProject.mesh.setLocalMeshDensity('arm1',20);

atom.selectedProject.mesh.getMesh;
atom.selectedProject.mesh.plotMesh;

atom.gui.designViewer.open;

%% end session
atom.quit