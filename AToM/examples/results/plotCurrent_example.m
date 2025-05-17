%% plotCurrent_example
% Example of current visualisation
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode

clc; clear; close all;

% prepare session
fileName = 'plotCurrent';
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
results.plotCurrent(mesh, 'basisFcns', basisFcns, 'iVec', iVec(:, 5));

%% basic usage with output parameters
% output: references to all graphical objects in figure

handles = results.plotCurrent(mesh, 'basisFcns', basisFcns, ...
    'iVec', iVec(:, 5));

%% usage of options
currentOptions = struct( ...
   'showCurrentIntensity', true, ...
   'showCurrentArrows', true, ...
   'showColorBar', true);

handles2 = results.plotCurrent(mesh, 'basisFcns', basisFcns, ...
    'iVec', iVec(:, 5), 'options', currentOptions);

%% select part of shown current
% possible input: {'Im', 'Re', 'Abs'}

handles3 = results.plotCurrent(mesh, 'basisFcns', basisFcns, ...
    'iVec', iVec(:, 5), 'part', 'Re');

%% set scale of used fill color
% possibilities: {'linear', 'normalized','logarithmic'}
handles4 = results.plotCurrent(mesh, 'basisFcns', basisFcns, ...
    'iVec', iVec(:, 5), 'scale', 'logarithmic'); 

%% set scale of arrows
% possibilities: {'uniform', 'proportional'}
handles5 = results.plotCurrent(mesh, 'basisFcns', basisFcns, ...
    'iVec', iVec(:, 5), 'arrowScale', 'proportional'); 

%% set size of the arrows (maximal size)
% Notice, arrowLength is maximal absolute size of an arrow.
handles6 = results.plotCurrent(mesh, 'basisFcns', basisFcns, ...
    'iVec', iVec(:, 5), 'arrowScale', 'proportional', 'arrowLength', 0.02); 

%% calculate  current and plot previously calculated charge
[Jx, Jy, Jz] = results.calculateCurrent(mesh, basisFcns, iVec(:, 5));

% insert components independently
handles = results.plotCurrent(mesh, 'Jx', Jx, 'Jy', Jy, 'Jz', Jz);

% insert components combined
J = [Jx Jy Jz];
handles = results.plotCurrent(mesh, 'J', J);