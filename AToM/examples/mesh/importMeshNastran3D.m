clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(true);
atom.createProject(fileName);

%% import 3D mesh from nastran
meshName = 'test_structure_nTetra_135';
atomPath = models.utilities.getAToMFolder;
importPath = fullfile(atomPath, 'examples', ...
   'mesh' ,'+data', [meshName '.nas']);
atom.selectedProject.mesh.importMesh(importPath);

%% end session
atom.exit;