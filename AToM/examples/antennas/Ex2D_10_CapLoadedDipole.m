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
atom.selectedProject.workspace.addVariable('c1', [0 0 0], 'center1')
atom.selectedProject.workspace.addVariable('r', 1, 'radius')
atom.selectedProject.workspace.addVariable('w', 'r/20', 'width')
atom.selectedProject.workspace.addVariable('v', '2*r/3', 'width')
atom.selectedProject.workspace.addVariable('c2', '[w/2 0 0]', 'center2')
atom.selectedProject.workspace.addVariable('c3', '[-w/2 0 0]', 'center3')

%% create Objects
atom.selectedProject.geom.addEllipse('c1', 'c1 + [r, 0, 0]', ...
   'c1 + [0, r, 0]', 0, 2*pi, 'OuterRing');
atom.selectedProject.geom.addEllipse('c1', 'c1 + [r-w, 0, 0]', ...
   'c1 + [0, r-w, 0]', 0, 2*pi, 'InnerRing');
atom.selectedProject.geom.addParallelogram('[-1.1*r, -v/2, 0]', ...
   '[1.1*r, -v/2, 0]', '[-1.1*r, v/2, 0]', 'LargePatchMinus');
atom.selectedProject.geom.addParallelogram('[-w/2, -r+w/2, 0]', ...
   '[w/2, -r+w/2, 0]', '[-w/2, r-w/2, 0]', 'SmallPatchPlus');

fig = atom.selectedProject.geom.plot;

%% cut objects
atom.selectedProject.geom.boolean.subtract('OuterRing', 'InnerRing');
atom.selectedProject.geom.boolean.subtract('OuterRing', 'LargePatchMinus');
atom.selectedProject.geom.boolean.unite('OuterRing', 'SmallPatchPlus');
fig = atom.selectedProject.geom.plot();

atom.selectedProject.mesh.setUseLocalMeshDensity( 'OuterRing', true);
atom.selectedProject.mesh.setLocalMeshDensity('OuterRing', 15);


atom.selectedProject.mesh.getMesh;
atom.selectedProject.mesh.plotMesh;


%% end session
atom.quit