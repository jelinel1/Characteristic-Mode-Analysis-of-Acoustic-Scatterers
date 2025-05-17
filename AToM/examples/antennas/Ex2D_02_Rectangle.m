%% Create a strip dipole and mesh
clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(true);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

%% create variables
atom.selectedProject.workspace.addVariable('L', 1, 'dipole length')
atom.selectedProject.workspace.addVariable('W', 'L/50', 'dipole width')

%% create Objects
atom.selectedProject.geom.addParallelogram('[-L/2, -W/2, 0] ', ...
   '[L/2, -W/2, 0]', '[-L/2, W/2, 0]', 'Dipole');
fig = atom.selectedProject.geom.plot;

%% end session
atom.quit