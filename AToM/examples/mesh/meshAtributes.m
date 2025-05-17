clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create geometry
atom.selectedProject.geom.addEllipse(...
   [-20 -20 0], [-10 -20 0], [-20 -10 0], 0, 2*pi);
atom.selectedProject.geom.addEllipseArc(...
   [0 0 0], [20 0 0], [0 10 0], 0, pi);
%% mesh
meshSize = 0.25;
atom.selectedProject.mesh.setGlobalMeshDensity(meshSize);
atom.selectedProject.mesh.getMesh();

%% vizualization
atom.selectedProject.mesh.plotMesh;

%% get mesh atributes built in
edgeLength = atom.selectedProject.mesh.edge2DLengths;
edgeCenter = atom.selectedProject.mesh.edge2DCenters;
triangleEdgeLength = atom.selectedProject.mesh.triangleEdgeLengths;
triangleEdgeCenter = atom.selectedProject.mesh.triangleEdgeCenters;
triangleCenter = atom.selectedProject.mesh.triangleCentroids;
triangleArea = atom.selectedProject.mesh.triangleAreas;
triangleCircumference = atom.selectedProject.mesh.triangleCircumferences;

%% get additional mesh atributes
edgeLengthTriangles = models.utilities.meshPublic.getEdgeLengthTriangle...
   (atom.selectedProject.mesh.nodes, atom.selectedProject.mesh.elements2D.connectivityList);
qualityTriangles = models.utilities.meshPublic.getTriangleQuality...
   (atom.selectedProject.mesh.nodes, atom.selectedProject.mesh.elements2D.connectivityList);

%% end session
atom.exit;