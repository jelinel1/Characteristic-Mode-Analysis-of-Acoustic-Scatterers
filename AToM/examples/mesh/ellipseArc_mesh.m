clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create EllipseArcs
atom.selectedProject.geom.addEllipseArc(...
   [0 0 0], [0 2 0], [1 0 0], 0, 2*pi);
atom.selectedProject.geom.addEllipseArc(...
   [3 0 0], [3 2 0], [2 0 0], 0, 2*pi);
atom.selectedProject.geom.addEllipseArc(...
   [-2 -2 0], [-1 -2 0], [-2 -1 0], 0, 2*pi);

%% mesh
atom.selectedProject.mesh.setGlobalMeshDensity(3e8/1e9/0.1);
atom.selectedProject.mesh.getMesh();

%% vizualization
atom.selectedProject.mesh.plot;

%% end session
atom.exit;