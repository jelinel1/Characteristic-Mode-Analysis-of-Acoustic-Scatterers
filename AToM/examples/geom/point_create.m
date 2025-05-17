clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% add parametric Variable 
atom.selectedProject.workspace.addVariable('c', 1, 'my var')

%% create Points
atom.selectedProject.geom.addPoint( '[1 0 0]');
atom.selectedProject.geom.addPoint( [1 1 1]);
atom.selectedProject.geom.addPoint( '[c+1 1 1-c]');
atom.selectedProject.geom.reconstructObject('Point1', 'Point', ...
   'coordVal', '[10 10 10]');
% vizualization of current Geom
fig = atom.selectedProject.geom.plot;

%% delete point 2
atom.selectedProject.geom.deleteObject('Point2', 'Point');
% slower alternative, search among all Curves
% atom.selectedProject.geom.deleteObject('Point2', ...
%    models.geom.GeomObjectType.Curve);
% the slowest alternative, search among all tzpes of objects
% atom.selectedProject.geom.deleteObject('Point2');

%% vizualization, if figure number is as input, the current window is closed
% if not, current geom is added to previous (deleted objects remain in the 
% figure, objects that changed are more-times in the figure)
atom.selectedProject.geom.plot(fig.Number);

%%
atom.selectedProject.save();

atom.exit;