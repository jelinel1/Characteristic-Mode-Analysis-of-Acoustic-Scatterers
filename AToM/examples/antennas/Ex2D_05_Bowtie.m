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
atom.selectedProject.workspace.addVariable('L', 2, 'length')
atom.selectedProject.workspace.addVariable('W', 'L/2', 'outer width')
atom.selectedProject.workspace.addVariable('w', 'W/8', 'inner width')

%% create Objects
atom.selectedProject.geom.addPolygon(['[0, -w/2, 0; L/2, -W/2, 0;', ...
   'L/2, W/2,0; 0, w/2, 0; -L/2, W/2, 0; -L/2, -W/2, 0;', ...
   '0, -w/2, 0]'], 'Bowtie');
% atom.selectedProject.geom.rotateZObject('Bowtie', -pi/8);
fig = atom.selectedProject.geom.plot;
% atom.selectedProject.mesh.setMeshSize('Bowtie', 0.05);
% atom.selectedProject.mesh.setUseLocalMeshSize( 'Bowtie', true);
% densityFunction =  '@(x, y) ones(size(x, 1),1)';
% atom.selectedProject.mesh.setDensityFunction( 'Bowtie', densityFunction );

%%
atom.selectedProject.physics.setFrequencyList(500e6)
meshDensity = 10;
atom.selectedProject.mesh.setLocalMeshDensity('Bowtie', meshDensity);
atom.selectedProject.mesh.setUseLocalMeshDensity( 'Bowtie', true);
densityFunction =  '@(x, y) ones(size(x, 1),1)';
atom.selectedProject.mesh.setLocalDensityFunction( 'Bowtie', densityFunction );

atom.selectedProject.mesh.getMesh;

atom.selectedProject.mesh.plotMesh;
%% end session
% atom.quit