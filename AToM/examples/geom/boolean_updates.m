clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(true);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

%% add Variables
atom.selectedProject.workspace.addVariable('w', 2);
atom.selectedProject.workspace.addVariable('w2', 0.6);
atom.selectedProject.workspace.addVariable('h', 0);
atom.selectedProject.workspace.addVariable('h2', 'h+0.2');
atom.selectedProject.workspace.addVariable('dx', -0.5);

%% create objects
atom.selectedProject.geom.addParallelogram('[0 h 0]', '[w h 0]', ...
   '[0 h+1 0]', 'par1')
atom.selectedProject.geom.addParallelogram('[0.2 h2 0]', '[0.2+w2 h2 0]', ...
   '[0.2 h2+0.6 0]', 'par2')
atom.selectedProject.geom.addParallelogram('[0.1 h+0.4 0]', '[0.6 h+0.4 0]', ...
   '[0.2 h+0.6 0]', 'par3')
atom.selectedProject.geom.addParallelogram('[1 h+0.5 0]', '[1.5 h+0.5 0]', ...
   '[1 h+0.6 0]', 'par4')

%% transform objects including Bool operations
atom.selectedProject.geom.boolean.subtract('par2', 'par3')

atom.selectedProject.geom.translateObject('par2', '[dx 0 0]')
fig = atom.selectedProject.geom.plot;

atom.selectedProject.geom.boolean.subtract('par1', 'par2')
atom.selectedProject.geom.boolean.subtract('par1', 'par4')
atom.selectedProject.geom.translateObject('par1', [2 -2 0])
fig = atom.selectedProject.geom.plot;

%% edit Variables in Workspace
% edit Variable of Master
atom.selectedProject.workspace.editExpression('w', 4);
fig = atom.selectedProject.geom.plot;
% edit Variable of transformation
atom.selectedProject.workspace.editExpression('dx', 0.5);
fig = atom.selectedProject.geom.plot;
% edit Variable common for all objects
atom.selectedProject.workspace.editExpression('h', 1);
fig = atom.selectedProject.geom.plot;
% edit Variable of Slave
atom.selectedProject.workspace.editExpression('h2', 'h+0.3');
fig = atom.selectedProject.geom.plot;

%% quit atom
atom.exit;