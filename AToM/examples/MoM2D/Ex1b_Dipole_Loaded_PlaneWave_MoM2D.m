%% Strip dipole illuminated by a plane wave and loaded by an R=100 Ohm load
% last check: 21.8.2019 (Miloslav Capek)
% To run ccrrectly, press "F5". One has to be in the examples/MoM2D folder.

close all;
clear;
clc;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% Model setup
% physics
nFrequencies = 100;
frequencyList = linspace(10e6, 1e9, nFrequencies);
atom.selectedProject.physics.setFrequencyList(frequencyList);

%% Mesh and port
atom.selectedProject.mesh.importMesh(fullfile(pwd, 'data', 'dipole', 'MoM2D_Ex2_mesh.nas'));

lumpedTriangles = [100 101];
Zload = 100;

atom.selectedProject.physics.feeding.add2DMeshPort(1, 'elements', lumpedTriangles, 'description', '');
atom.selectedProject.physics.feeding.editLumpedCircuit(1, ...
   'isEnabled', true, ...
   'type', 'ser', ...
   'R', Zload, ...
   'L', 'NaN', ...
   'C', 'NaN', ...
   'userImpedance', 'NaN');

% Plane wave, solve MoM
atom.selectedProject.physics.feeding.addPlaneWave('Plane_Wave_1', ...
   'propagationVector', '[1 1 0]', ...
   'initElectricField', '[-1/sqrt(2) 1/sqrt(2) 0]', ...
   'axialRatio', 'Inf', ...
   'direction', 'left', ...
   'isEnabled', true);

atom.selectedProject.solver.MoM2D.setProperties(...
   'quadOrder', 1, ...   
   'resultRequests', 'basisFcns, mesh, iVec, vVec, zInActive');
atom.selectedProject.solver.MoM2D.solve();

%% Get induced voltage at load
ports = atom.selectedProject.physics.feeding.getPortValues;

mesh = atom.selectedProject.mesh.getMeshData2D;
basisFcns = atom.selectedProject.solver.MoM2D.results.basisFcns;
[tf, IDbasisFcn] = ismember(sort(lumpedTriangles, 2), sort(basisFcns.data(:,...
   [basisFcns.Col.trianglePlus, basisFcns.Col.triangleMinus]), 2), 'rows');

edgeLength = mesh.triangleEdgeLengths(basisFcns.data(IDbasisFcn,basisFcns.Col.edge));
CurrentAtPort = edgeLength*atom.selectedProject.solver.MoM2D.results.iVec.data(IDbasisFcn,:);
InducedVoltage = Zload.*CurrentAtPort;
fprintf(2, 'Notice that AToM package is still running. Quit it by \n >> atom.quit; \n');

%% load FEKO results, plot
load(fullfile('data', 'dipole', 'MoM2D_Ex2c_FEKO_InducedVoltage.mat'));

figure;
hold on;
plot(frequencyList, real(InducedVoltage),'--b','LineWidth',2);
plot(frequencyList, imag(InducedVoltage)','--r','LineWidth',2);
plot(frequencyList, abs(InducedVoltage)','--k','LineWidth',2);
plot(FEKO_f, FEKO_ReU,'b');
plot(FEKO_f, FEKO_ImU,'r');
plot(FEKO_f, sqrt(FEKO_ReU.^2+FEKO_ImU.^2),'k');
xlabel('f [Hz]');ylabel('U_{load}');
legend('Re(U) AToM', 'Im(U) AToM','|U| AToM','Re(U) FEKO', 'Im(U) FEKO','|U| FEKO');
grid on;

%% end session
atom.exit;