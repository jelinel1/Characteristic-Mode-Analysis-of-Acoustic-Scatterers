clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% Workspace
atom.selectedProject.workspace.addVariable('mue', '1', '');
atom.selectedProject.workspace.addVariable('tandm', '0', '');
atom.selectedProject.workspace.addVariable('sigmaMetal', 'realmax', '');
atom.selectedProject.workspace.addVariable('epsilon', '3', '');
atom.selectedProject.workspace.addVariable('tand', '0.0045', '');
atom.selectedProject.workspace.addVariable('sigmaDielectric', '0', '');
% atom.gui.workspaceViewer.open
% Checking
% materials staff and number of variables before creation of new materials
clc
mediumTable = atom.selectedProject.physics.materials.getTable
dielectricTable = atom.selectedProject.physics.materials.getDielectricTable
metalTable = atom.selectedProject.physics.materials.getMetalTable
variablesNumber = length(atom.selectedProject.workspace.list)

%% Creation of materials
% dielectrics
clc
atom.selectedProject.physics.materials.addDielectric(...
   'myDielectric_1', ...
   'Permittivity', 'epsilon', ...
   'LossTangent', 'tand', ...
   'Conductivity', 'sigmaDielectric');
atom.selectedProject.physics.materials.addDielectric(...
   'myDielectric_2', ...
   'Permittivity', '3', ...
   'LossTangent', '0.045', ...
   'Conductivity', '0');
% Metals
atom.selectedProject.physics.materials.addMetal(...
   'myMetal_1', ...
   'Permeability', 'mue', ...
   'LossTangent', 'tandm', ...
   'Conductivity', 'sigmaMetal');
atom.selectedProject.physics.materials.addMetal(...
   'myMetal_2', ...
   'Permeability', '1', ...
   'LossTangent', '0', ...
   'Conductivity', '5e8');
% Checking
% materials staff and number of variables before creation of new materials
clc
mediumTable = atom.selectedProject.physics.materials.getTable
dielectricTable = atom.selectedProject.physics.materials.getDielectricTable
metalTable = atom.selectedProject.physics.materials.getMetalTable
variablesNumber = length(atom.selectedProject.workspace.list)

%% Deleting materials
atom.selectedProject.physics.materials.removeMedium('myMetal_2')
atom.selectedProject.physics.materials.removeMedium('myDielectric_2')
% Checking
% materials staff and number of variables before creation of new materials
clc
mediumTable = atom.selectedProject.physics.materials.getTable
dielectricTable = atom.selectedProject.physics.materials.getDielectricTable
metalTable = atom.selectedProject.physics.materials.getMetalTable
variablesNumber = length(atom.selectedProject.workspace.list)

%% Editing of materials
atom.selectedProject.physics.materials.editMedium(...
   'myMetal_1', ...
   'Permeability', '1', ...
   'LossTangent', '2', ...
   'Conductivity', '3');

atom.selectedProject.physics.materials.editMedium(...
   'myDielectric_1', ...
   'Permittivity', '4', ...
   'LossTangent', '5', ...
   'Conductivity', '6');
% Checking
% materials staff and number of variables before creation of new materials
clc
mediumTable = atom.selectedProject.physics.materials.getTable
dielectricTable = atom.selectedProject.physics.materials.getDielectricTable
metalTable = atom.selectedProject.physics.materials.getMetalTable
variablesNumber = length(atom.selectedProject.workspace.list)

%%
atom.quit