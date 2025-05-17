%% Example of AFS for dipole created in AToM
clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% Geometry
atom.selectedProject.geom.addParallelogram([0, 0, 0], ...
   [0.01, 0, 0], [0 0.3 0], 'dipole');

%% Physics
frequencyList = (0.5:0.1:3).*1e9;
atom.selectedProject.physics.setFrequencyList(frequencyList);

%% Mesh
atom.selectedProject.mesh.setUseUniformTriangulation(true);
atom.selectedProject.mesh.setUniformMeshType('right');
atom.selectedProject.mesh.setGlobalMeshDensity('10');

atom.selectedProject.mesh.getMesh;
atom.selectedProject.mesh.plotMesh;

%% GEP
% handle to inner solver
atom.selectedProject.solver.GEP.setProperties(...
   'innerSolver', 'CMs (MoM2D)',...
   'corrType', 'IRI',...
   'nModes', 10,...
   'showStatusWindow', true,...
   'matricesStorage', 'ram',...
   'AFSresultsAtGivenSamples', true,...
   'AFSnIterations', 2,...
   'AFSgoal', 'resonance',...
   'charAngleBoundaryTop', 240,...
   'charAngleBoundaryBottom', 120);

atom.selectedProject.solver.GEP.solve();
%%
atom.exit;