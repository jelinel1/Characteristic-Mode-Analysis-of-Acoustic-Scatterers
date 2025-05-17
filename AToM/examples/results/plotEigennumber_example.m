%% plotEigennumber_example
% Example of eigennumber visualisation
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode

clc; clear; close all;

% prepare session
fileName = 'plotEigennumber';
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

eigennumber = atom.selectedProject.solver.GEP.results.eigNum.sorted.data;
frequency = atom.selectedProject.solver.GEP.frequencyList;

atom.quit
close all
%% plotEigenvalue basic usage
results.plotEigennumber('frequency', frequency, ...
    'eigennumber', eigennumber);

%% plotEigenvalue when you have characteristic angle
characteristicAngle = results.calculateCharacteristicAngle(eigennumber);
results.plotEigennumber('frequency', frequency, ...
   'characteristicAngle', characteristicAngle);

%% plotEigenvalue add new lines to existing figure
handles = results.plotEigennumber('frequency', frequency, ...
   'eigennumber', eigennumber(1:5, :));

hold on;

handles = results.plotEigennumber('frequency', frequency, ...
   'eigennumber', eigennumber(6:10, :), 'handles', handles);