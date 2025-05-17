%% planeWaves_example shows Feeding capabilities with plane waves.
% This script shows all public Feeding capabilities with plane waves.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
% mcode

clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% adding plane waves
% Adding waves is made via addPlaneWave method of Feeding class. First argument
% is name of the wave and next values are prop-value pairs. Values can be
% logical, char od numeric.

% Default wave is linearly polarized and has:
% isEnabled = true
% direction = 'right'
% propagationVector = [1, 0, 0]
% initElectricField = [0, 0, 1]
% axialRatio = Inf

% adding wave with default name 
atom.selectedProject.physics.feeding.addPlaneWave('PlaneWave1');
% adding wave with name 'default_wave'
atom.selectedProject.physics.feeding.addPlaneWave('default_wave');

%% circularly or elliptically polarized wave.
% axialRatio can be in interval <1; Inf>. 1 for circular and Inf for linear
% polarization
% elliptical wave with ratio 5 of perpendicular components of electrical field.
atom.selectedProject.physics.feeding.addPlaneWave('elliptical_wave', ...
   'axialRatio', 5);

%% left-handed linearly polarized wave
atom.selectedProject.physics.feeding.addPlaneWave('linear_wave', ...
   'axialRatio', Inf, 'direction', 'left');

%% circularly polarized wave with propragation vector in Z direction and initial
% electrical field in Y direction
atom.selectedProject.physics.feeding.addPlaneWave('circular_wave', ...
   'propagationVector', [0 0 1], 'initElectricField', '[0 1 0]', ...
   'axialRatio', 1);

%% it is possible create wave which is not enable from the beginning
atom.selectedProject.physics.feeding.addPlaneWave('dafault_wave2', ...
   'isEnabled', false);

%% Parametried waves
% is is possible to define all parameters as expressions with variables from
% workspace
% adding variables
atom.selectedProject.workspace.addVariable('propVec', [0 0 1]);
atom.selectedProject.workspace.addVariable('initField', [1 0 0]);
atom.selectedProject.workspace.addVariable('axialRatio', 2);

atom.selectedProject.workspace.addVariable('isEnabled', false);

atom.selectedProject.physics.feeding.addPlaneWave('common_wave', ...
   'propagationVector', 'propVec', 'initElectricField', '2*initField', ...
   'axialRatio', 'axialRatio', 'isEnabled', 'isEnabled');

%% it is possible to use short form of parameters name
% the same wave as before:
atom.selectedProject.physics.feeding.addPlaneWave('common_wave2', ...
   'prop', 'propVec', 'initE', 'initField', 'axial', 'axialRatio');

%% to see all feeders use property table of Feeder object
feedTable_1 = atom.selectedProject.physics.feeding.table;
feedTable_1.planeWaves

%% Editing variables in workspace will affect waves which use these variables 
% for its definition.
atom.selectedProject.workspace.editExpression('initField', [1 1 0]);
% when is some variable changed in the way that the result of expression has 
% wrong physical meaning the wave has property isValid = false.
% Error is thrown:
% atom.selectedProject.workspace.editExpression('axialRatio', 2+1j);

% see difference
feedTable_2 = atom.selectedProject.physics.feeding.table;
feedTable_2.planeWaves

%% Editing of waves is possible via editWave method.
% The first input is name of wave and next inputs are property-value pairs.
atom.selectedProject.physics.feeding.editWave('default_wave', ...
   'initE', '2*fliplr(initField)');

%% Renaming wave with editWave method.
atom.selectedProject.physics.feeding.editWave('default_wave', ...
   'name', 'renamed_default_wave');

% see difference
feedTable_3 = atom.selectedProject.physics.feeding.table;
feedTable_3.planeWaves
%% Deleting plane waves
% use method deleteFeeder
atom.selectedProject.physics.feeding.deleteWave('common_wave');
% see difference
feedTable_4 = atom.selectedProject.physics.feeding.table;
feedTable_4.planeWaves
%% save project and close it and open again
atom.selectedProject.save;
atom.closeProject;
atom.openProject(fileName);
% planes are loaded from HDF file
feedTable_4 = atom.selectedProject.physics.feeding.table;
feedTable_4.planeWaves
%% Quit
atom.quit;