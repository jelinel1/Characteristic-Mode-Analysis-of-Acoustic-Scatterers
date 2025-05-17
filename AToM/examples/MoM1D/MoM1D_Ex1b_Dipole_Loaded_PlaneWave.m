%% Wire dipole illuminated by a plane wave and loaded by an R=100 Ohm load
%% 3.2.2019
close all; 
clear all; 
clc;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% Geometry
L = 1; % length of dipole
radius = L/400; % wire radius
% this radius is approximately equivalent to a strip dipole of width L/100
atom.selectedProject.geom.addLine([-L/2, 0, 0; L/2, 0, 0], 'Line');

%% Model setup
% physics
nFrequencies = 100;
frequencyList = linspace(10e6, 1e9, nFrequencies);
atom.selectedProject.physics.setFrequencyList(frequencyList);

%%
Zload = 100; % loading impedance

atom.selectedProject.mesh.setGlobalMeshDensity(3e8/max(frequencyList)/(L/100))

% port sits at the origin
atom.selectedProject.physics.feeding.add1DDiscretePort(1, 'base', 'Line', 'positionPar', '[0,0,0]');

atom.selectedProject.mesh.getMesh();
% see table with list of ports
% table1 = atom.selectedProject.physics.feeding.table.discrete1DPorts;

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

atom.selectedProject.solver.MoM1D.setProperties(...
   'quadOrder', 3, ...
   'resultRequests', 'mesh, basisFcns, zMat, iVec, zInActive, vVec',...
   'wireRadius', radius, ...
   'nWorkers', 0);
atom.selectedProject.solver.MoM1D.solve();

%% Get induced voltage at load

% get mesh and basis function data
Mesh = atom.selectedProject.mesh.getMeshData1D;
basisFcns = atom.selectedProject.solver.MoM1D.results.basisFcns;

% find basis function where the port is
tmp = Mesh.nodes(basisFcns.data(:,3),:)-[0,0,0];
IDbasisFcn = find(sqrt(sum(tmp.*tmp,2)) < radius,1);

CurrentAtPort = atom.selectedProject.solver.MoM1D.results.iVec.data(IDbasisFcn,:);
InducedVoltage = Zload.*CurrentAtPort;

%% load FEKO results, plot
load(fullfile('data', '1D_dipole', 'MoM1D_Ex1b_FEKO_InducedVoltage.mat'));

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