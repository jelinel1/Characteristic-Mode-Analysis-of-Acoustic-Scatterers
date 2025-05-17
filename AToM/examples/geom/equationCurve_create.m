clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% add parametric Variable 
atom.selectedProject.workspace.addVariable('c', 1, 'my var')


%% create EquationCurve
atom.selectedProject.geom.addEquationCurve(...
   '@(t) sin(t) + 1', '@(t) t - 2', '@(t) 0*t', [0 2*pi]);
atom.selectedProject.geom.addEquationCurve('@(t) t.^3', '@(t) t', ...
   '@(t) 0*t', [-2 2]);
%% vizualization of current Geom
fig = atom.selectedProject.geom.plot;

%% delete ellipsearc 2
atom.selectedProject.geom.deleteObject('EquationCurve2', 'EquationCurve');
% slower alternative, search among all Curves
% atom.selectedProject.geom.deleteObject('EquationCurve2', ...
%    models.geom.GeomObjectType.Curve);
% the slowest alternative, search among all tzpes of objects
% atom.selectedProject.geom.deleteObject('EquationCurve2');


%% vizualization, if figure number is as input, the current window is closed
% if not, current geom is added to previous (deleted objects remain in the 
% figure, objects that changed are more-times in the figure)
fig = atom.selectedProject.geom.plot(fig.Number);

%%
atom.selectedProject.save();

atom.exit;