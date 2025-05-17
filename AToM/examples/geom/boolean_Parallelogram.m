clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

atom.selectedProject.geom.addParallelogram([0 0 0], ...
   [2 0.5 0], [0.5 1.5 0]);
atom.selectedProject.geom.addParallelogram([1 0.7 0], ...
   [1.3 0.7 0], [1 0.9 0]);
atom.selectedProject.geom.addParallelogram([4 0 0], ...
   [6 0.5 0], [4.5 1.5 0]);
atom.selectedProject.geom.addParallelogram([5 -1 0], ...
   [5.5 -1 0], [5 3 0]);


atom.selectedProject.geom.plot;
atom.selectedProject.geom.addLine([0 0 0; 2 3 0]);

atom.selectedProject.geom.boolean.subtract('Parallelogram1', 'Parallelogram2');

fig1 = atom.selectedProject.geom.plot;

atom.selectedProject.geom.boolean.subtract('Parallelogram3', 'Parallelogram4');
fig2 = atom.selectedProject.geom.plot;


%% get Mesh
atom.selectedProject.mesh.getMesh;


%% clear geom and atom
atom.selectedProject.save;
atom.exit;



