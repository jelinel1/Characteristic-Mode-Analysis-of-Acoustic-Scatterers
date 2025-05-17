clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(true);
atom.createProject(fileName);

%% example 1 - multiple objects
meshName = 'planesNonParallel';
atomPath = models.utilities.getAToMFolder;
importPath = fullfile(atomPath, 'examples', ...
   'mesh', '+data', [meshName '.nas']);
atom.selectedProject.mesh.importMesh(importPath);
atom.selectedProject.mesh.meshToPolygon(meshName);
atom.selectedProject.mesh.deleteMesh(meshName);
atom.selectedProject.mesh.setGlobalMeshDensity(3);

%% example 2 - fractal
% meshName = 'MphtxtImportTestFile';
% atomPath = models.utilities.getAToMFolder;
% importPath = fullfile(atomPath, ...
%    'examples', 'mesh', '+data', strcat(meshName, '.mphtxt'));
% atom.selectedProject.mesh.importMesh(importPath);
% atom.selectedProject.mesh.meshToPolygon(meshName);
% atom.selectedProject.mesh.deleteMesh(meshName);
% atom.selectedProject.mesh.setGlobalMeshDensity(0.1);

%% example 3 - object with holes
% meshName = 'meshWithHoles';
% atomPath = models.utilities.getAToMFolder;
% importPath = fullfile(atomPath, ...
%    'examples', 'mesh', '+data', strcat(meshName, '.nas'));
% atom.selectedProject.mesh.importMesh(importPath);
% atom.selectedProject.mesh.meshToPolygon(meshName);
% atom.selectedProject.geom.boolean.subtract('Polygon2', 'Polygon3');
% atom.selectedProject.geom.boolean.subtract('Polygon2', 'Polygon1');
% atom.selectedProject.mesh.deleteMesh(meshName);
% atom.selectedProject.mesh.setGlobalMeshDensity(8);

%% create mesh
atom.selectedProject.geom.plot;
atom.selectedProject.mesh.getMesh;
atom.selectedProject.mesh.plotMesh;

%% end session
atom.exit;