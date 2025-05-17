clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% set meshOnFly - meshOnFly on
atom.selectedProject.mesh.setProperties('meshOnFly', 1);

%% add EllipseArc and vizualization
atom.selectedProject.geom.addEllipseArc(...
   [0 0 0], [2 0 0], [0 1 0], 0, pi);
atom.selectedProject.mesh.plot;

%% add EllipseArc and vizualization
atom.selectedProject.geom.addEllipseArc(...
   [2 2 0], [2 4 0], [3 2 0], 0, pi/2);
atom.selectedProject.mesh.plot;

%% change meshSize and vizualization
atom.selectedProject.mesh.setUseLocalMeshDensity('EllipseArc1', true);
atom.selectedProject.mesh.setLocalMeshDensity('EllipseArc1', 3e8/1e9/0.1);
atom.selectedProject.mesh.plot;

%% delete object and vizualization
atom.selectedProject.geom.deleteObject('EllipseArc2');
atom.selectedProject.mesh.plot;

%% end session
atom.exit;