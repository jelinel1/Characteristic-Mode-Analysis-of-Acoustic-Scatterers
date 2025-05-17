%% 3-element Yagi antenna
clc; close all; clear all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

%% create variables
f0   = 1.5e9; % frequency of design
lam  = 3e8/f0;
L1   = 0.802*lam;
L2   = 0.474*lam;
L3   = 0.403*lam;
d12  = 0.19*lam;
d23  = 0.146*lam;
a    = 0.001*lam;
atom.selectedProject.workspace.addVariable('L1', L1, 'reflector length');
atom.selectedProject.workspace.addVariable('L2', L2, 'active dipole');
atom.selectedProject.workspace.addVariable('L3', L3, 'director');
atom.selectedProject.workspace.addVariable('d12', d12, 'reflector - active');
atom.selectedProject.workspace.addVariable('d23', d23, 'active - director');

%% create Objects
atom.selectedProject.geom.addLine([-L1/2, -d12, 0; L1/2, -d12, 0], 'Reflector');
atom.selectedProject.geom.addLine([-L2/2, 0, 0; L2/2, 0, 0], 'Active');
atom.selectedProject.geom.addLine([-L3/2, d23, 0; L3/2, d23, 0], 'Director');

fig = atom.selectedProject.geom.plot;

%% Physics
frequencyList = linspace(1e8, 5e9, 100);
atom.selectedProject.physics.setFrequencyList(frequencyList);

%% Mesh
% set MeshSize
% segment = L2/100;
atom.selectedProject.mesh.setGlobalMeshDensity(3e8/max(frequencyList)/(L2/50))
% atom.selectedProject.mesh.setMeshSize('Reflector',segment);
% atom.selectedProject.mesh.setMeshSize('Active', segment);
% atom.selectedProject.mesh.setMeshSize('Director', segment);

%atom.gui.designViewer.open;

%% Port

atom.selectedProject.physics.feeding.add1DDiscretePort(1, 'base', 'Active', ...
   'pos', 0.5);
atom.selectedProject.physics.feeding.editFeeder(1, 'isEnable', true);
atom.selectedProject.mesh.getMesh();

%% see table with list of ports
table1 = atom.selectedProject.physics.feeding.table.discrete1DPorts

%% solver
% set quadratures and output requests

atom.selectedProject.solver.MoM1D.setProperties(...
   'quadOrder', 1, ...
   'resultRequests', 'mesh, basisFcns, zMat, iVec, zInActive',...
   'wireRadius', a, ...
   'nWorkers', 0);
atom.selectedProject.solver.MoM1D.solve();
r1 = atom.selectedProject.solver.MoM1D.results;

atom.selectedProject.solver.MoM1D.setProperties(...
   'quadOrder', 3, ...
   'resultRequests', 'mesh, basisFcns, zMat, iVec, zInActive',...
   'wireRadius', a, ...
   'nWorkers', 0);
atom.selectedProject.solver.MoM1D.solve();
r3 = atom.selectedProject.solver.MoM1D.results;

atom.selectedProject.solver.MoM1D.setProperties(...
   'quadOrder', 5, ...
   'resultRequests', 'mesh, basisFcns, zMat, iVec, zInActive',...
   'wireRadius', a, ...
   'nWorkers', 0);
atom.selectedProject.solver.MoM1D.solve();
r5 = atom.selectedProject.solver.MoM1D.results;

atom.selectedProject.solver.MoM1D.setProperties(...
   'quadOrder', 7, ...
   'resultRequests', 'mesh, basisFcns, zMat, iVec, zInActive',...
   'wireRadius', a, ...
   'nWorkers', 0);
atom.selectedProject.solver.MoM1D.solve();
r7 = atom.selectedProject.solver.MoM1D.results;

Zin_quad1 = r1.zInActive.data;
Zin_quad3 = r3.zInActive.data;
Zin_quad5 = r5.zInActive.data;
Zin_quad7 = r7.zInActive.data;


%% Plot input impedance

load(fullfile('data', '1D_3elYagi','results_FEKO'));
fFEKO = linspace(1e8, 5e9, 500);

figure;
hold on;
plot(frequencyList, real(Zin_quad1),'r');
plot(frequencyList, imag(Zin_quad1),'r--');
plot(frequencyList, real(Zin_quad3),'g');
plot(frequencyList, imag(Zin_quad3),'g--');
plot(frequencyList, real(Zin_quad5),'b');
plot(frequencyList, imag(Zin_quad5),'b--');
plot(frequencyList, real(Zin_quad7),'m');
plot(frequencyList, imag(Zin_quad7),'m--');
plot(fFEKO,Z_FEKO(:,2),'k','LineWidth',2);
plot(fFEKO,Z_FEKO(:,3),'k--','LineWidth',2);
xlabel('f [Hz]'); ylabel('Z_{in} [\Omega]');
legend('R, nQuad = 1','X, nQuad = 1','R, nQuad = 3','X, nQuad = 3'...
      ,'R, nQuad = 5','X, nQuad = 5','R, nQuad = 7','X, nQuad = 7'...
      ,'R FEKO','X FEKO');

title(['Input impedance of a 3-element Yagi-Uda antenna']);
grid on;
ylim([-2000 2000]);  

%% end session
atom.exit;