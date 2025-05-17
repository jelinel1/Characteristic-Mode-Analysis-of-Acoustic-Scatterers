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
atom.selectedProject.workspace.addVariable('L', 2, 'width of patch')
atom.selectedProject.workspace.addVariable('l', '3*L/8', 'slot width')
atom.selectedProject.workspace.addVariable('W', '2*L/3', 'height of patch')
atom.selectedProject.workspace.addVariable('w', 'W/2', 'slot height')
atom.selectedProject.workspace.addVariable('k', 'l/5', 'slot spacing')

%% create Objects
atom.selectedProject.geom.addParallelogram('[-L/2, -W/2, 0]', ...
   '[L/2, -W/2, 0]', '[-L/2, W/2, 0]', 'Patch');
atom.selectedProject.geom.addPolygon(['[-l/2, -w/2, 0; l/2, -w/2, 0; ', ...
   'l/2, w/2, 0; k/2, w/2, 0; k/2, -(w/2 - k), 0; -k/2, -(w/2 - k), 0; ', ...
   '-k/2, w/2, 0; -l/2, w/2, 0; -l/2, -w/2, 0]'], 'Slot');
fig = atom.selectedProject.geom.plot;

%% cut objects
atom.selectedProject.geom.boolean.subtract('Patch', 'Slot');
fig = atom.selectedProject.geom.plot();

%% end session
atom.quit