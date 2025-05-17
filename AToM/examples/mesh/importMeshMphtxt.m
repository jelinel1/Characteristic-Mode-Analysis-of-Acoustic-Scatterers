clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% import mesh from mphtxt
meshName = 'MphtxtImportTestFile';
atomPath = models.utilities.getAToMFolder;
importPath = fullfile(atomPath, 'examples', ...
   'mesh', '+data', [meshName '.mphtxt']);
atom.selectedProject.mesh.importMesh(importPath);

%% visualization
atom.selectedProject.mesh.plotMesh;
data = atom.selectedProject.mesh.getMeshData2D;

%% end session
atom.exit;