%% resultsClass_pickTool_example
% Example of picking tool (data coursor)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode

clc; clear; close all;

% prepare session
fileName = 'pickTool';
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

% Physics
frequencyList = linspace(0.5e9, 1.5e9, 11)';
atom.selectedProject.physics.setFrequencyList(frequencyList);

% Geometry
atom.selectedProject.geom.addParallelogram([0, 0, 0], ...
   [1, 0, 0], [0 0.02 0], 'dipole');

% Mesh
meshSize = 10;
atom.selectedProject.mesh.setGlobalMeshDensity( meshSize );
atom.selectedProject.mesh.getMesh;

% GEP
% handle to inner solver
atom.selectedProject.solver.GEP.setProperties(...
   'innerSolver', 'CMs (MoM2D)',...
   'corrType', 'II',...
   'nModes', 20,...
   'showStatusWindow', true,...
   'matricesStorage', 'ram',...
   'AFSresultsAtGivenSamples', true,...
   'AFSnIterations', 1,...
   'AFSgoal', 'resonance',...
   'charAngleBoundaryTop', 240,...
   'charAngleBoundaryBottom', 120);

atom.selectedProject.solver.GEP.solve();

%% create Results
results = results.Results.start(false);

%% load data from GEP
results.loadGEP(atom);

%% close AToM
atom.quit;
close all;

%% pre-calculate characteristic angle and characteristic currents
results.calculateCharacteristicAngle([],[],[]);
results.calculateCurrent([],[],[]);

%% plot characteristic angle
% shows plot of characteristic angle
% when the option results.options.charAngle.dataCursor is true, it is possible
% to pick arbitrary point and it opens figure with characteristic current of
% this mode
%
% SYNTAX: results.plotCharacteristicAngle(/SlotName/);
results.plotCharacteristicAngle('pickTool_GEP');

%% create new figure, plot eigenvalues
% opens new figure
results.figure;

% shows plot of eigenvalues
% work similarly as plot CharacteristicAngle with the same option in
% results.options.eigNum.dataCursor
%
results.plotEigennumber('pickTool_GEP');

%% delete Results instance
results.quit;