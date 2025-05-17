clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(true);
atom.createProject(fileName);

%% import 2D mesh from nastran
meshName = 'NastranImportTestFile';
atomPath = models.utilities.getAToMFolder;
importPath = fullfile(atomPath, 'examples', ...
   'mesh' ,'+data', [meshName '.nas']);
atom.selectedProject.mesh.importMesh(importPath);

%% visualization
atom.selectedProject.mesh.plotMesh;
data = atom.selectedProject.mesh.getMeshData2D;

%% end session
atom.exit;