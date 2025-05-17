clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create geometry
atom.selectedProject.geom.addEllipse(...
   [0 0 0], [20 0 0], [0 10 0], 0, pi);

%% mesh
meshSize = 0.25;
atom.selectedProject.mesh.setGlobalMeshDensity( meshSize );
atom.selectedProject.mesh.getMesh();

%% vizualization
atom.selectedProject.mesh.plotMesh;

%% export
atomPath = models.utilities.getAToMFolder;
exportPath = fullfile(atomPath, 'examples', 'mesh', '+data');
atom.selectedProject.mesh.exportMesh(exportPath, 'exportTest', 'nas');

%% atom quit
atom.exit;

%% create project again
projectName = 'mesh_work.atom';
filePath = fullfile(pwd,projectName);

%% delete old project file
if exist(filePath, 'file')
   delete(filePath);
end

%% init AToM, create project
atom = Atom.initialize(false);
atom.createProject(projectName);

%% import
atomPath = models.utilities.getAToMFolder;
importPath = fullfile(atomPath, 'examples', 'mesh', '+data', 'exportTest.nas');
atom.selectedProject.mesh.importMesh(importPath);

%% visualization
atom.selectedProject.mesh.plotMesh;

%% end session
atom.exit;

%%
delete(importPath);
