clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create objects
atom.selectedProject.geom.addEllipseArc( ...
   [0, 1, 1], [0, 3, 1], [0 1 2], 0, pi);
atom.selectedProject.geom.addLine( [0, -2, 1.5; 0, 4, 1.5]);  
atom.selectedProject.geom.addLine( [0, 1, -1; 0, 1, 3]);  
atom.selectedProject.geom.addLine( [0, 1, 0; 0, 4, 1.5]);

%% create PolyCurve
atom.selectedProject.geom.addPolyCurve( ...
   'Line1, Line2, Line3, EllipseArc1');

%% mesh
atom.selectedProject.mesh.setGlobalMeshDensity(2);
atom.selectedProject.mesh.getMesh();

%% vizualization
atom.selectedProject.mesh.plot;

%% end session
atom.exit;