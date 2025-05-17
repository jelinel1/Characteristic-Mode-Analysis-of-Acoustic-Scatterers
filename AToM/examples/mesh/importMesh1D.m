clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% import 1D mesh from NASTRAN
meshName = 'wide_U_mesh1D';
atomPath = models.utilities.getAToMFolder;
importPath = fullfile(atomPath, 'examples', ...
   'mesh', '+data', [meshName '.nas']);
atom.selectedProject.mesh.importMesh(importPath);

%% visualization
atom.selectedProject.mesh.plot;

%% end session
atom.exit;