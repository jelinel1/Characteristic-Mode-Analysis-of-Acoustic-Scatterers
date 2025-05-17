%% Example of GEP using AToM using hdd storage
clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% Geometry
% at.selectedProject.geom.addParallelogram(...
% [0, 0, 0], [1, 0, 0], [0 0.02 0], 'dipole');

atom.selectedProject.geom.addParallelogram([0, 0, 0], ...
   [0.15, 0, 0], [0 0.3 0], 'patch');

%% Physics
frequencyList = (0.5:0.1:2).*1e9;
atom.selectedProject.physics.setFrequencyList(frequencyList);

%% Mesh
atom.selectedProject.mesh.setGlobalMeshDensity(10);
atom.selectedProject.mesh.getMesh;
atom.selectedProject.mesh.plotMesh;

%% set MoM
atom.selectedProject.solver.MoM2D.setProperties('quadOrder', 2);

%% GEP
% handle to inner solver
atom.selectedProject.solver.GEP.setProperties(...
   'innerSolver', 'CMs (MoM2D)',...
   'corrType', 'II',...
   'nModes', 10,...
   'showStatusWindow', true,...
   'matricesStorage', 'hdd',...
   'AFSresultsAtGivenSamples', true,...
   'AFSnIterations', 3,...
   'AFSgoal', 'crossing, endOfMode',...
   'charAngleBoundaryTop', 240,...
   'charAngleBoundaryBottom', 120);

atom.selectedProject.solver.GEP.solve();

%%
atom.exit;