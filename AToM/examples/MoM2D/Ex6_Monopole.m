%% Strip monopole on circular ground plane
% last check: 21.8.2019 (Miloslav Capek)
% To run ccrrectly, press "F5". One has to be in the examples/MoM2D folder.

clc;
clear;
close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(true);
atom.createProject(fileName);
%% Preferences setting #beginnig
% automatically set during carrying out of createProject method
atom.selectedProject.workspace.setProperties('nSignificantDigitsView', 10);
atom.selectedProject.geom.setProperties('tolerance', 1e-10);
atom.selectedProject.geom.setProperties('nPointsOnCurve', 73);
atom.selectedProject.mesh.setProperties('tolerance', 1e-10);
atom.selectedProject.mesh.setProperties('nPointsOnEquationCurve', 500000);
atom.selectedProject.mesh.setProperties('nPointsOnEllipseArc', 500000);
atom.selectedProject.mesh.setProperties('meshOnFly', 0);
%Preferences #end
%% Geometry
atom.selectedProject.workspace.addVariable('a', '100e-3', '');
atom.selectedProject.workspace.editDescription('a', 'radius of the ground plane');
atom.selectedProject.workspace.addVariable('H', '50e-3', '');
atom.selectedProject.workspace.editDescription('H', 'monopole height');
atom.selectedProject.workspace.addVariable('W', '2e-3', '');
atom.selectedProject.workspace.editDescription('W', 'monopole width');
atom.selectedProject.workspace.addVariable('feedpos', '2e-3', '');
atom.selectedProject.workspace.editDescription('feedpos', 'Z position of the feeder');

atom.selectedProject.geom.addCircle('[0 0 0]', 'a', 'z', 'GND');
atom.selectedProject.geom.addRectangle('[0 0 H/2]', 'W', 'H', 'x', 'monopole');

atom.selectedProject.geom.boolean.unite('monopole', 'GND');

%% Port setup
atom.selectedProject.physics.feeding.add2DDiscretePort(1, 'baseObjName', ...
    'monopole', 'positionPar', '[0, -W/2, feedpos; 0, W/2, feedpos]', 'description', 'port');
atom.selectedProject.physics.feeding.editFeeder(1, 'isEnabled', true, ...
    'type', 'voltage', 'value', '1');

%% Meshing
atom.selectedProject.physics.setFrequencyList('linspace(1, 3, 50)*1e9');
atom.selectedProject.mesh.setGlobalMeshDensity('9');
atom.selectedProject.mesh.getMesh();

%% Solver
atom.selectedProject.solver.MoM2D.setProperties('nBatchMax', 2000, ...
    'nWorkers', 0, 'verbosity', 2, 'quadOrder', 1, 'resultsInRAM', true, 'resultsInFile', false);
atom.selectedProject.solver.MoM2D.setProperties('resultRequests', ...
    'basisFcns, mesh, zInActive, Jx, Jy, Jz, divJ, iVec, vVec');

atom.selectedProject.solver.MoM2D.solve();

R = real(atom.selectedProject.solver.MoM2D.results.zInActive.data);
X = imag(atom.selectedProject.solver.MoM2D.results.zInActive.data);

%% Plot input impedance

frequencyList = atom.selectedProject.solver.MoM2D.results.frequencyList.data;

figure('Name', 'Input impedance');
hold on;
plot(frequencyList, R,'b','LineWidth',2);
plot(frequencyList, X,'r','LineWidth',2);
legend('R', 'X');
title('Input impedance');
%ylim([-3000 3000]);
grid on;
xlabel('f [Hz]');
ylabel('Z [\Omega]');

%% Plot current
basisFcns = atom.selectedProject.solver.MoM2D.results.basisFcns;
iVec = atom.selectedProject.solver.MoM2D.results.iVec.data;
mesh      = atom.selectedProject.solver.MoM2D.results.mesh;

results.plotCurrent(mesh, 'basisFcns', basisFcns, 'iVec', iVec(:, 10))
handles = results.plotCurrent(mesh, 'basisFcns', basisFcns, 'iVec', ...
    iVec(:, 10));
handles2 = results.plotCurrent(mesh, 'basisFcns', basisFcns, ...
    'iVec', iVec(:, 10), 'part', 'abs', 'scale', 'linear');
%% end session
atom.exit;