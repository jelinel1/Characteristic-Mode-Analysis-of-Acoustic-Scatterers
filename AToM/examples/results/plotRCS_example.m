%% plotRCS_example
% Example of RCS visualisation
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode

clc; clear; close all;

% prepare session
fileName = 'plotRCS';
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

atom.selectedProject.physics.feeding.addPlaneWave('Plane_Wave', ...
   'propagationVector', '[0 0 1]', 'initElectricField', '[1 0 0]', ...
   'axialRatio', 'Inf', 'direction', 'right', 'isEnabled', true);

% Mesh
meshSize = 10;
atom.selectedProject.mesh.setGlobalMeshDensity( meshSize );
atom.selectedProject.mesh.getMesh();

%% MoM setup
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

%% basic usage
results.plotRCS('mesh', mesh, 'basisFcns', basisFcns, ...
   'iVec', iVec(:, 5), 'frequency', frequencyList(5), ...
   'independentVariable', 'theta', 'fixedDimensionPhi', pi/2);

%% compute and plot RCS
[RCS, theta, phi] = results.calculateRCS(mesh, basisFcns, iVec(:, 5), ...
   frequencyList(5));

results.plotRCS('RCS', RCS, 'theta', theta, 'phi', phi, ...
   'independentVariable', 'theta', 'fixedDimensionPhi', pi/2);

