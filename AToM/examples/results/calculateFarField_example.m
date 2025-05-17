%% calculateFarField_example
% Example of Far-Field calculation
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode

% prepare session
fileName = 'calculateFarField';
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

%% basic usage
farfield1 = results.calculateFarField(mesh, frequencyList(5), ...
   'basisFcns', basisFcns, 'iVec', iVec(:, 5));

%% usage with given theta and phi
theta = linspace(0, pi, 200);
phi = linspace(0, 2*pi, 200);
farfield2 = results.calculateFarField(mesh, frequencyList(5), ...
    'basisFcns', basisFcns, 'iVec', iVec(:, 5), 'theta', theta, ...
    'phi', phi);

%% calculate farfield from given current
[Jx, Jy, Jz] = results.calculateCurrent(mesh, basisFcns, iVec(:, 5));
farfield3 = results.calculateFarField(mesh, frequencyList(5), ...
    'theta', theta, 'basisFcns', basisFcns, 'iVec', iVec(:, 5), ...
    'phi', phi, 'Jx', Jx, 'Jy', Jy, 'Jz', Jz);

% or
J = [Jx Jy Jz];
farfield4 = results.calculateFarField(mesh, frequencyList(5), ...
    'theta', theta, 'phi', phi, 'J', J, 'basisFcns', basisFcns, ...
    'iVec', iVec(:, 5));

%% calculate farfield can specify used quadrature order
farfield5 = results.calculateFarField(mesh, frequencyList(5), ...
    'basisFcns', basisFcns, 'iVec', iVec(:, 5), 'theta', theta, ...
    'phi', phi, 'quadOrder', 5);