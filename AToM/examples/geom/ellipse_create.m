clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% add parametric Variable 
atom.selectedProject.workspace.addVariable('c', 1, 'my var');

%% create Ellipses
atom.selectedProject.geom.addEllipse(...
   [0 0 0], [2 0 0], '[0 c 0]', 0, pi);
atom.selectedProject.geom.addEllipse(...
   [2 2 0], [2 4 0], [3 2 0], 0, pi/2);
atom.selectedProject.geom.addEllipse(...
   [-2 -2 0], [-1 -2 0], [-2 -1 0], 0, 2*pi);
% vizualization of current Geom
noToHistory = atom.selectedProject.geom;
fig = noToHistory.plot;

%% delete ellipse 2
atom.selectedProject.geom.deleteObject('Ellipse2', 'Ellipse');
% slower alternative, seh among all Curves
% atom.selectedProject.geom.deleteObject('Ellipse2', ...
%    models.geom.GeomObjectType.Curve);
% the slowest alternative, seh among all tzpes of objects
% atom.selectedProject.geom.deleteObject('Ellipse2');

%% vizualization, if figure number is as input, the current window is closed
% if not, current geom is added to previous (deleted objects remain in the 
% figure, objects that changed are more-times in the figure)
noToHistory = atom.selectedProject.geom;
% noToHistory.plot(fig.Number);
%%
% atom.selectedProject.save();

atom.exit;