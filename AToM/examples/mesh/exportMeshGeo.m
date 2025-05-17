clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create geometry
atom.selectedProject.geom.addParallelogram('[-1/2 -1/4 0]', '[1/2 -1/4 0]', '[-1/2 1/4 0]', 'Parallelogram1');
atom.selectedProject.geom.addEllipse('[0 0 0]', '[1 0 0]', '[0 1/2 0]', '0', '2*pi', 'Ellipse1');
atom.selectedProject.geom.boolean.subtract('Ellipse1', 'Parallelogram1');

%% create mesh
atom.selectedProject.mesh.setGlobalMeshDensity(4);
atom.selectedProject.mesh.getMesh;

%% vizualization
atom.selectedProject.mesh.plotMesh;

%% export
atomPath = models.utilities.getAToMFolder;
exportPath = fullfile(atomPath, 'examples', 'mesh', '+data');
atom.selectedProject.mesh.exportMesh(exportPath, 'exportTest', 'geo');

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
importPath = fullfile(atomPath, 'examples', 'mesh' ,'+data', 'exportTest.geo');
atom.selectedProject.mesh.importMesh(importPath);

%% plot imported mesh
atom.selectedProject.mesh.plotMesh;

%% end session
atom.exit;

%%
delete(importPath);
