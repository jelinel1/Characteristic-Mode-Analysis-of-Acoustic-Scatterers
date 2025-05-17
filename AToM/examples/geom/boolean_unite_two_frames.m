clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

%% create Objects 
atom.selectedProject.geom.addParallelogram([2 1 0], ...
   [4 1 0], [2 2 0]);
atom.selectedProject.geom.addParallelogram([2.2 1.2 0], ...
   [3.8 1.2 0], [2.2 1.8 0]);

atom.selectedProject.geom.addParallelogram([1 0.6 0], ...
   [3 0.6 0], [1 1.6 0]);
atom.selectedProject.geom.addParallelogram([1.2 0.8 0], ...
   [2.8 0.8 0], [1.2 1.4 0]);

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



