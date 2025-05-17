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
atom.selectedProject.workspace.addVariable('c', [0 0 0], 'center1')
atom.selectedProject.workspace.addVariable('a', 1, 'major radius')
atom.selectedProject.workspace.addVariable('b', '2*a/3', 'minor radius')

%% create Objects
atom.selectedProject.geom.addEllipse('c', 'c + [a, 0, 0]', ...
   'c + [0, b, 0]', 0, 2*pi, 'Ellipse');
% fig = atom.selectedProject.geom.plot;

atom.selectedProject.physics.setFrequencyList('1e9');
atom.selectedProject.mesh.setUseLocalMeshDensity('Ellipse', true);
atom.selectedProject.mesh.setLocalMeshDensity('Ellipse', 10);
densityFunction =  '@(x, y) ones(size(x, 1),1)';
atom.selectedProject.mesh.setLocalDensityFunction( 'Ellipse', densityFunction );

a = cputime
atom.selectedProject.mesh.getMesh;
cputime - a 

atom.selectedProject.mesh.plotMesh;
%% end session
atom.quit