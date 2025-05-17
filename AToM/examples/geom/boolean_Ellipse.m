clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

atom.selectedProject.geom.addEllipse([-3 2 0], ...
   [-1 2 0], [-3 3 0], 0, pi);

atom.selectedProject.geom.addEllipse([5 5 0], ...
   [7 5 0], [5 6 0], 0, 2*pi);
atom.selectedProject.geom.redrawObject('Ellipse2', 123, 'Ellipse');

atom.selectedProject.geom.addParallelogram([-3.5 1 0], ...
   [-2.5 1 0], [-3.0 3.1 0]);
atom.selectedProject.geom.addParallelogram([-3.5 2.1 0], ...
   [-3.4 2.1 0], [-3.4 2.2 0]);


atom.selectedProject.geom.addParallelogram([-4.5 2.5 0], ...
   [-4.3 2.5 0], [-4.3 2.7 0]);

atom.selectedProject.geom.plot;

atom.selectedProject.geom.boolean.subtract('Ellipse1', 'Parallelogram1');

fig1 = atom.selectedProject.geom.plot;

atom.selectedProject.geom.boolean.subtract('Ellipse1', 'Parallelogram2');
fig2 = atom.selectedProject.geom.plot;

% atom.selectedProject.geom.copy('Elipse1', 'Elipse');

atom.selectedProject.geom.boolean.subtract('Ellipse1', 'Parallelogram3');
fig3 = atom.selectedProject.geom.plot;

%% clear geom and atom
atom.selectedProject.save;
atom.exit;



