%% Strip dipole with two ports, one fed and second loaded with a complex impedance
% last check: 21.8.2019 (Miloslav Capek)
% To run ccrrectly, press "F5". One has to be in the examples/MoM2D folder.

close all;
clear;
clc;

%% Initialize AToM, create geometry and mesh

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

lumpedTriangles = [150, 151]; % load  
portTriangles   = [101, 100]; % feed

%% Mesh
atom.selectedProject.mesh.importMesh(...
   fullfile(pwd, 'data', 'dipole', 'MoM2D_Ex2_mesh.nas'));

%% Load impedance and feeding
Zload = 100 + 1i*30; % load impedance at second port
Z = repmat([Zload, 0], numel(frequencyList), 1);

atom.selectedProject.physics.feeding.add2DMeshPort(1, ...
   'elements', lumpedTriangles, ...
   'description', '');

atom.selectedProject.physics.feeding.editLumpedCircuit(1, ...
   'isEnabled', true, ...
   'type', 'ser', ...
   'R', 'NaN', ...
   'L', 'NaN', ...
   'C', 'NaN', ...
   'userImpedance', Z);

atom.selectedProject.physics.feeding.add2DMeshPort(2, ...
   'elements', portTriangles, ...
   'description', '');

atom.selectedProject.physics.feeding.editFeeder(2, ...
   'isEnabled', true, ...
   'type', 'voltage', ...
   'value', '1');

%% Solve MoM
atom.selectedProject.solver.MoM2D.setProperties(...
   'quadOrder', 3, ...   
   'resultRequests', 'basisFcns, mesh, iVec, vVec, zInActive, Jx');
atom.selectedProject.solver.MoM2D.solve();

%% Get current at loaded port, calculate voltage
mesh = atom.selectedProject.mesh.getMeshData2D;
basisFcns = atom.selectedProject.solver.MoM2D.results.basisFcns;
[tf, IDbasisFcn] = ismember(sort(lumpedTriangles, 2), sort(basisFcns.data(:,...
   [basisFcns.Col.trianglePlus, basisFcns.Col.triangleMinus]), 2), 'rows');

edgeLength = mesh.triangleEdgeLengths(basisFcns.data(IDbasisFcn,basisFcns.Col.edge));
CurrentAtPort = edgeLength*atom.selectedProject.solver.MoM2D.results.iVec.data(IDbasisFcn,:);
InducedVoltage = Zload.*CurrentAtPort;

Z = atom.selectedProject.solver.MoM2D.results.zInActive.data;
fprintf(2, 'Notice that AToM package is still running. Quit it by \n >> atom.quit; \n');

%% Compare with FEKO
load(fullfile('data', 'dipole', 'MoM2D_Ex2b_FEKO_InducedVoltage_port-port.mat'));

% input impedance
figure('Name', 'Input impedance');
hold on;
plot(frequencyList, real(Z)','--b','LineWidth',2);
plot(frequencyList, imag(Z)','--r','LineWidth',2);
plot(FEKO_f, R_FEKO,'b');
plot(FEKO_f, X_FEKO,'r');
ylim([-2000, 1500]);
legend('R AToM', 'X AToM','R FEKO','X FEKO');
title('Driving impedance');
grid on;
xlabel('f [Hz]');
ylabel('Z [\Omega]');

% induced voltage
figure('Name', 'Induced voltage at load');
hold on;
plot(frequencyList, real(InducedVoltage),'--b','LineWidth',2);
plot(frequencyList, imag(InducedVoltage)','--r','LineWidth',2);
plot(frequencyList, abs(InducedVoltage)','--k','LineWidth',2);
plot(FEKO_f, Real_Uload_FEKO,'b');
plot(FEKO_f, Imag_Uload_FEKO,'r');
plot(FEKO_f, sqrt(Real_Uload_FEKO.^2+Imag_Uload_FEKO.^2),'k');
legend('Re(U) AToM', 'Im(U) AToM','|U| AToM','Re(U) FEKO', 'Im(U) FEKO','|U| FEKO');
xlabel('f [Hz]');
ylabel('U_{load} [V]');

grid on;

%% end session
atom.exit;