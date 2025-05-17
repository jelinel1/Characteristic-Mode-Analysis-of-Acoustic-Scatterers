clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

%% create objects
atom.selectedProject.geom.addEquationCurve('@(t) t', ...
   '@(t) (t).^2', '@(t) 0*t', [-1 1]);
atom.selectedProject.geom.addEllipseArc([0 1 0], ...
   [1 1 0], [0 2 0], 0, pi/2);
atom.selectedProject.geom.addLine([-1 1 0; 0 2 0]);

%% vizualization of current Geom
fig = atom.selectedProject.geom.plot;

%% create PolyLoop
atom.selectedProject.geom.addPolyLoop( ...
   'EquationCurve1, Line1, EllipseArc1');

%% vizualize Geom with PolyLoop 
fig = atom.selectedProject.geom.plot(fig.Number);

%%
atom.exit;