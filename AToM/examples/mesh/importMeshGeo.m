clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(true);
atom.createProject(fileName);

%% import mesh from geo
meshName = 'dipole';
atomPath = models.utilities.getAToMFolder;
importPath = fullfile(atomPath, 'examples', ...
   'mesh', '+data', [meshName '.geo']);
atom.selectedProject.mesh.importMesh(importPath);

%% visualization
atom.selectedProject.mesh.plotMesh;

%% end session
atom.exit;