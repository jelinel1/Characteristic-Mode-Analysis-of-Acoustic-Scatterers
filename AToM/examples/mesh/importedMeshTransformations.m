clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(true);
atom.createProject(fileName);

%% import mesh
meshName = 'MphtxtImportTestFile';
atomPath = models.utilities.getAToMFolder;
importPath = fullfile(atomPath, 'examples', ...
   'mesh', '+data', [meshName '.mphtxt']);
atom.selectedProject.mesh.importMesh(importPath, 'meshName');

%% rename mesh
atom.selectedProject.mesh.renameImportedMesh('meshName', 'myMesh');

%% translate mesh
atom.selectedProject.mesh.translateImportedMesh('myMesh', [1 2 3]);
atom.selectedProject.mesh.translateImportedMesh('myMesh', [0 0 1], 1);

%% scale mesh
atom.selectedProject.mesh.scaleImportedMesh('myMesh', [2 2 2]);
atom.selectedProject.mesh.scaleImportedMesh('myMesh', [2 2 2], 1);

%% mirror mesh
atom.selectedProject.mesh.mirrorImportedMesh('myMesh', [1 0 0]);
atom.selectedProject.mesh.mirrorImportedMesh('myMesh', [1 0 0], 1);

%% rotate mesh
atom.selectedProject.mesh.rotateImportedMesh('myMesh', [pi/8 0 0]);
atom.selectedProject.mesh.rotateImportedMesh('myMesh', [pi/8 0 0], 2);

%% end session
atom.exit;