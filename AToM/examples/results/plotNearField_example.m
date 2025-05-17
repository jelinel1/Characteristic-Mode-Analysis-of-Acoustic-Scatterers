%% plotNearField_example
% Example of near-field visualisation
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode

clc; clear; close all;

% prepare session
fileName = 'plotNearField';
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

% create variables
atom.selectedProject.workspace.addVariable('L', 0.5, 'half length');
atom.selectedProject.workspace.addVariable('W', 0.01, 'half width');

% Physics
nFrequencies = 25;
frequencyList = linspace(100e6, 500e6, nFrequencies);
atom.selectedProject.physics.setFrequencyList(frequencyList);

% Geometry
atom.selectedProject.geom.addParallelogram('[-L, -W, 0]', ...
   '[L, -W, 0]', '[-L, W, 0]', 'dipole');

% Feeding
atom.selectedProject.physics.feeding.add2DDiscretePort(1, ...
   'baseObjName', 'dipole', ...
   'positionPar', '[0, -W, 0; 0, W, 0]', ...
   'description', 'port1');
atom.selectedProject.physics.feeding.editFeeder(1, 'isEnabled', true, ...
   'type', 'voltage', 'value', '1');

% Mesh
meshSize = 10;
atom.selectedProject.mesh.setGlobalMeshDensity( meshSize );
atom.selectedProject.mesh.getMesh();

% MoM2D solver setup
atom.selectedProject.solver.MoM2D.setProperties('resultRequests', ...
   'basisFcns, mesh, iVec', ...
   'verbosity', 2, 'nBatchMax', 2000, ...
   'nWorkers', 0);
atom.selectedProject.solver.MoM2D.setProperties('quadOrder', 1);
atom.selectedProject.solver.MoM2D.solve();

mesh = atom.selectedProject.solver.MoM2D.results.mesh;
basisFcns = atom.selectedProject.solver.MoM2D.results.basisFcns;
iVec = atom.selectedProject.solver.MoM2D.results.iVec.data;

atom.quit;
close all;

%% basic usage without any preferences
% Visualisation of near-field in the plane (x, z) which is parpendicular 
% to y axis and goes through the origin. Vectors uPoints and vPoints 
% define y and z coordinates of the points in which the near-field will
% be computed.
% uPoints - x coordinates
% vPoints - z coordinates
plane = 'y';
uPoints = -2:0.025:2;
vPoints = -2:0.025:2;

results.plotNearField('mesh', mesh, 'basisFcns', basisFcns, ...
   'iVec', iVec(:, 5), 'frequency', frequencyList(5), 'plane', plane, ...
   'distance', 0, 'uPoints', uPoints, 'vPoints', vPoints);

%% visualisation of near-field with added vidualisation of mesh
handles = results.plotMesh(mesh);
results.plotNearField('mesh', mesh, 'basisFcns', basisFcns, ...
   'iVec', iVec(:, 5), 'frequency', frequencyList(5), 'plane', plane, ...
   'distance', 0, 'uPoints', uPoints, 'vPoints', vPoints, ...
   'handles', handles);