%% Create a strip dipole and mesh
clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

%% create variables
atom.selectedProject.workspace.addVariable('c', [0 0 0], 'center1')
atom.selectedProject.workspace.addVariable('r', 1, 'radius')

%% create Objects
atom.selectedProject.geom.addEllipse('c', 'c + [r, 0, 0]', ...
   'c + [0, r, 0]', 0, 2*pi, 'Circle');
fig = atom.selectedProject.geom.plot;

%% end session
atom.quit