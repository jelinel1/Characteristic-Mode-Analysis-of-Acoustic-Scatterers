%% resultsClass_example
% Example of Results class
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode

clc; clear; close all;
% prepare session
fileName = 'resultsClass';
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

%% Create Results object
results = results.Results.start(false);

%% load data from MoM
results.loadMoM(atom);

%% quit atom
atom.quit

%% calculate current
% SYNTAX:
% results.calculateCurrent(/dataName/, /SlotName/, /ListPointName/)
%
% it is possible to replace one or more inputs by []
% Examples: 
% 1) /dataName/ input is replaced by [] and other two are correctly
% inserted -> the function will calculate current for all inserted data in given 
% listPoint located in given Slot.
%     results.calculateCurrent([], 'Slot1', 'LP1')
%
% 2) /listpointName/ input is replaced by [] and other two are correctly
% inserted -> the function will calculate current for given data (selected by
% dataName) in all listPoint in given Slot
%     results.calculateCurrent('mom', 'Slot1', [])
%
% 3) ...
%     results.calculateCurrent('mom', [], [])
%     results.calculateCurrent([], 'Slot1', [])
%     results.calculateCurrent([], [], []);

results.calculateCurrent('MoM2D', 'resultsClass_MoM2D', []); 
% there is only one slot and one data set defined by dataName

%% calculate charge
% SYNTAX:
% results.calculateCharge(/dataName/, /SlotName/, /ListPointName/)
%
% Same behavior as calculateCurrent

results.calculateCharge('MoM2D', 'resultsClass_MoM2D', []);

%% calculate far-field
% SYNTAX:
% results.calculateFarField(/dataName/, /SlotName/, /ListPointName/)
%
% Same behavior as calculateCurrent

results.calculateFarField('MoM2D', 'resultsClass_MoM2D', []);

%% plot mesh
% SYNTAX:
% results.plotMesh(/SlotName/)

results.plotMesh('resultsClass_MoM2D');

%% plot current
% SYNTAX:
% results.plotCurrent(/dataName/, /SlotName/, /ListPointName/, /Part/)
% part = {'Im', 'Re', 'Abs'}

results.plotCurrent('MoM2D', 'resultsClass_MoM2D', 'f1');

%% plot charge
% SYNTAX:
% results.plotCharge(/dataName/, /SlotName/, /ListPointName/, /Part/)
% part = {'Im', 'Re', 'Abs'}
results.figure
results.plotCharge('MoM2D', 'resultsClass_MoM2D', 'f1');

%% delete Results instance
results.quit
