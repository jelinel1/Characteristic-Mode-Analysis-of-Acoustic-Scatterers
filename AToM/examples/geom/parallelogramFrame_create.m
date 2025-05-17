clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% add parametric Variable 
atom.selectedProject.workspace.addVariable('c', 1, 'my var')

%% create ParallelogramFrame
atom.selectedProject.geom.addParallelogramFrame([0, 0, 0], ...
   [2, 0, 0], [1 1 0]);
atom.selectedProject.geom.addParallelogramFrame([3 3 0], [4 3 0], ...
   [3 4 0]);
atom.selectedProject.geom.addParallelogramFrame([0 -2 -2], ...
   [0 -4 -2], [0 -3 -3]);
% vizualization of current Geom
fig = atom.selectedProject.geom.plot;

%% delete ParallelogramFrame 1
atom.selectedProject.geom.deleteObject('ParallelogramFrame1', ...
   'ParallelogramFrame');
% slower alternative, search among all Curves
% atom.selectedProject.geom.deleteObject('ParallelogramFrame1', ...
%    models.geom.GeomObjectType.Curve);
% the slowest alternative, search among all tzpes of objects
% atom.selectedProject.geom.deleteObject('ParallelogramFrame1');

%% vizualization, if figure number is as input, the current window is closed
% if not, current geom is added to previous (deleted objects remain in the 
% figure, objects that changed are more-times in the figure)
atom.selectedProject.geom.plot(fig.Number);

%%
atom.selectedProject.save();

atom.exit;