clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

%% create Objects 
atom.selectedProject.geom.addParallelogram([0 0 0], ...
   [3 0 0], [0 2 0]);
atom.selectedProject.geom.addParallelogram([-0.2 0.2 0], ...
   [2.8 0.2 0], [-0.2 2.2 0]);
atom.selectedProject.geom.addParallelogram([0.5 -0.5 0], ...
   [3.5 -0.5 0], [0.5 1.5 0]);
atom.selectedProject.geom.addParallelogram([0.7 -0.7 0], ...
   [3.7 -0.7 0], [0.7 1.3 0]);

atom.selectedProject.geom.plot;

%% perform two subtractions
atom.selectedProject.geom.boolean.subtract('Parallelogram1', 'Parallelogram2');
atom.selectedProject.geom.boolean.subtract('Parallelogram3', 'Parallelogram4');

fig1 = atom.selectedProject.geom.plot;

%% perform unite
atom.selectedProject.geom.boolean.unite('Parallelogram3', 'Parallelogram1');
fig2 = atom.selectedProject.geom.plot;

%% clear geom and atom
% atom.selectedProject.save;
atom.exit;



