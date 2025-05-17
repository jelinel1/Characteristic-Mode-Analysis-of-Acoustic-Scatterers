clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% add parametric Variable 
atom.selectedProject.workspace.addVariable('c', 1, 'my var')

%% create Lines
atom.selectedProject.geom.addLine( '[1, 0, 0; 2, 1, 0]');
atom.selectedProject.geom.addLine( [1, 1, 1; 2, 2, 2]);
atom.selectedProject.geom.addLine( '[c, 1, 0; c+2, 1 0]');
% vizualization of current Geom
fig = atom.selectedProject.geom.plot;

%% delete line 2
atom.selectedProject.geom.deleteObject('Line2', 'Line');
% slower alternative, search among all Curves
% atom.selectedProject.geom.deleteObject('Line2', ...
%    models.geom.GeomObjectType.Curve);
% the slowest alternative, search among all tzpes of objects
% atom.selectedProject.geom.deleteObject('Line2');

%% vizualization, if figure number is as input, the current window is closed
% if not, current geom is added to previous (deleted objects remain in the 
% figure, objects that changed are more-times in the figure)
atom.selectedProject.geom.plot(fig.Number);

%%
atom.selectedProject.save();

atom.exit;