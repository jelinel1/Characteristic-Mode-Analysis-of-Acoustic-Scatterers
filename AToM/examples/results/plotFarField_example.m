%% plotFarField_example
% Example of Far-Field visualisation
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode

clc; clear; close all;

% prepare session
fileName = 'plotFarField';
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

%% basic usage without any preferences, graphical settings set by template
results.plotFarField('mesh', mesh, 'basisFcns', basisFcns, ...
   'iVec', iVec(:, 5), 'frequency', frequencyList(5));

%% basic usage with output parameters
% output: references to all graphical objects in figure

handles = results.plotFarField('mesh', mesh, 'basisFcns', basisFcns, ...
   'iVec', iVec(:, 5), 'frequency', frequencyList(5));

%% specify the output data
% using the parameter 'function' is possible to influence ploted data 
% (based on the output structure of function results.calculateFarField

handles2 = results.plotFarField('mesh', mesh, 'basisFcns', basisFcns, ...
   'iVec', iVec(:, 5), 'userFunction', @(FF) abs(FF.FTheta), ...
   'frequency', frequencyList(5));

%% usage of options
farFieldOptions = struct( ...
   'showFarField', true, ...
   'showSphericalCoordinates', true, ...
   'showCartesianCoordinates', true, ...
   'showColorBar', true);

handles3 = results.plotFarField('mesh', mesh, 'basisFcns', basisFcns, ...
   'iVec', iVec(:, 5), 'options', farFieldOptions, ...
   'frequency', frequencyList(5));

%% set vector theta and phi
theta = linspace(0, pi, 200);
phi = linspace(0, 2*pi, 200);
handles4 = results.plotFarField('mesh', mesh, 'basisFcns', basisFcns, ... 
   'iVec', iVec(:, 5), 'theta', theta, 'phi', phi, ...
   'frequency', frequencyList(5));

%% calculate farField and plot previously calculated charge
farfield = results.calculateFarField(mesh, frequencyList(5), 'theta', theta, ...
   'phi', phi, 'basisFcns', basisFcns, 'iVec', iVec(:, 5));
handles5 = results.plotFarField('farField', abs(farfield.D), ...
   'theta', theta, 'phi', phi);
