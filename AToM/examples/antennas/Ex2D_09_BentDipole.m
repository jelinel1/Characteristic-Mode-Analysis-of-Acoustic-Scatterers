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
atom.selectedProject.workspace.addVariable('c', [0 0 0], 'center')
atom.selectedProject.workspace.addVariable('r', 1, 'radius')
atom.selectedProject.workspace.addVariable('w', 'r/20', 'width')
atom.selectedProject.workspace.addVariable('a', ...
   40/360*2*pi, 'angle of cut')

%% create Objects
atom.selectedProject.geom.addEllipse('c', 'c + [r, 0, 0]', ...
   'c + [0, r, 0]', 'a/2', '2*pi - a', 'BentDipole');
atom.selectedProject.geom.addEllipse('c', 'c + [r-w, 0, 0]', ...
   'c + [0, r-w, 0]', 'a/2', '2*pi - a', 'InnerRing');
fig = atom.selectedProject.geom.plot;

%% cut objects
atom.selectedProject.geom.boolean.subtract('BentDipole', 'InnerRing');
fig = atom.selectedProject.geom.plot();
%%
atom.selectedProject.mesh.setLocalMeshDensity('BentDipole', 20);
atom.selectedProject.mesh.setUseLocalMeshDensity( 'BentDipole', true);
densityFunction =  '@(x, y) ones(size(x, 1),1)';
atom.selectedProject.mesh.setLocalDensityFunction( 'BentDipole', densityFunction );

a = cputime
atom.selectedProject.mesh.getMesh;
cputime - a

atom.selectedProject.mesh.plotMesh;
%% end session
atom.quit