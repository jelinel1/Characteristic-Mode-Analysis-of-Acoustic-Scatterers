%% plotS_example
% Example of s parameters visualisation
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode

clc; clear; close all;

% prepare session
fileName = 'plotS';
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

% create variables
atom.selectedProject.workspace.addVariable('L', 0.5, 'half length');
atom.selectedProject.workspace.addVariable('W', 0.01, 'half width');
atom.selectedProject.workspace.addVariable('G', 0.1, ...
    'gap between dipoles');

% Physics
nFrequencies = 25;
frequencyList = linspace(100e6, 500e6, nFrequencies);
atom.selectedProject.physics.setFrequencyList(frequencyList);

% Geometry
atom.selectedProject.geom.addParallelogram('[-L, -W, 0]', ...
    '[L, -W, 0]', '[-L, W, 0]', 'dipole1');
atom.selectedProject.geom.addParallelogram('[-L, -W+G, 0]', ...
    '[L, -W+G, 0]', '[-L, W+G, 0]', 'dipole2');

% Feeding
atom.selectedProject.physics.feeding.add2DDiscretePort(1, ...
    'baseObjName', 'dipole1', ...
    'positionPar', '[0, -W, 0; 0, W, 0]', ...
    'description', 'port1');
atom.selectedProject.physics.feeding.editFeeder(1, 'isEnabled', true, ...
    'type', 'voltage', 'value', '1');
atom.selectedProject.physics.feeding.add2DDiscretePort(2, ...
    'baseObjName', 'dipole2', ...
    'positionPar', '[0, -W+G, 0; 0, W+G, 0]', ...
    'description', 'port1');
atom.selectedProject.physics.feeding.editFeeder(2, 'isEnabled', true, ...
    'type', 'voltage', 'value', '1');

% Mesh
meshSize = 10;
atom.selectedProject.mesh.setGlobalMeshDensity( meshSize );
atom.selectedProject.mesh.getMesh();

% MoM2D solver setup
atom.selectedProject.solver.MoM2D.setProperties('resultRequests', ...
    'zInMutual', ...
    'verbosity', 2, 'nBatchMax', 2000, ...
    'nWorkers', 0);
atom.selectedProject.solver.MoM2D.setProperties('quadOrder', 1);
atom.selectedProject.solver.MoM2D.solve();

zInMutual = atom.selectedProject.solver.MoM2D.results.zInMutual.data;

atom.quit;
close all;

%% calculate S parameters
S = results.calculateS(zInMutual);

%% visualise s parameters
% select parameter description
% +-----+-----+                  +-----+-----+
% | S11 | S12 |                  |  1  |  3  |
% +-----+-----+  -> 'select' ->  +-----+-----+
% | S21 | S22 |                  |  2  |  4  |
% +-----+-----+                  +-----+-----+
%
results.plotS('s', S, 'frequency', frequencyList, 'select', 1)
results.plotS('s', S, 'frequency', frequencyList, 'select', 2)
results.plotS('s', S, 'frequency', frequencyList, ...
    'select', [1, 2], 'scale', 'dB')
