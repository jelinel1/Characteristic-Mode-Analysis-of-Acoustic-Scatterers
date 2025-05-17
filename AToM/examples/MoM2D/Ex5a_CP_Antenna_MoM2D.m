%% MoM2D_Ex5a_CP_Antenna Circularly polarized antenna in AToM w/o PEC GND
% last check: 21.8.2019 (Miloslav Capek)
% To run ccrrectly, press "F5". One has to be in the examples/MoM2D folder.
% 
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com

clc;
clear;
close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% Geometry
%arms and feeding gap
L1  = 15e-3;
L2  = 10e-3;
L3  = 65e-3;
W   = 35e-3;
d   = 1.5e-3;
gap = 1e-3;

%feeding rectangle
centerX = L1+L2/2;
centerY = -d-gap/2;
fW      = 1e-3; %width and length of feeding rectangle
fL      = gap;

atom.selectedProject.workspace.addVariable('L1', L1);
atom.selectedProject.workspace.addVariable('L2', L2);
atom.selectedProject.workspace.addVariable('L3', L3);
atom.selectedProject.workspace.addVariable('W', W);
atom.selectedProject.workspace.addVariable('d', d);
atom.selectedProject.workspace.addVariable('gap', gap);
atom.selectedProject.workspace.addVariable('centerX', centerX);
atom.selectedProject.workspace.addVariable('centerY', centerY);
atom.selectedProject.workspace.addVariable('fW', fW);
atom.selectedProject.workspace.addVariable('fL', fL);
atom.selectedProject.workspace.addVariable('position', '[centerX-fW/2, centerY, 0; centerX+fW/2, centerY, 0]') % absolute position of feed at feeding rectangle

% arms of the dipole
atom.selectedProject.geom.addPolygon(['[0, 0, 0; L1, 0, 0; L1, -d, 0; L1+L2, -d, 0; L1+L2, 0, 0;L1+L2+L3, 0, 0; L1+L2+L3, W, 0; 0, W, 0; 0, 0,0]'],'Arm1');
atom.selectedProject.geom.addPolygon(['[L1,-d-gap,0;L1+L2,-d-gap,0;L1+L2,-d-d-gap,0;L1+L2+L1,-d-d-gap,0;L1+L2+L1,-d-d-gap-W,0;L1-L3,-d-d-gap-W,0;L1-L3,-d-d-gap,0;L1,-d-d-gap,0;L1,-d-gap,0]'],'Arm2');

% feeding rectangle
atom.selectedProject.geom.addRectangle([centerX, centerY, 0], fW, fL,'z','FR');
atom.selectedProject.geom.boolean.unite('Arm1', 'Arm2');
atom.selectedProject.geom.boolean.unite('FR', 'Arm1');
fig = atom.selectedProject.geom.plot;

% set port
atom.selectedProject.physics.feeding.add2DDiscretePort(1, 'base', 'FR', 'pos', 'position');
atom.selectedProject.physics.feeding.editFeeder(1, 'isE', true);

% show port info
table2 = atom.selectedProject.physics.feeding.table.discrete2DPorts
table  = atom.selectedProject.physics.feeding.table.deltaGapFeeders

%% physics
nFrequencies = 50;
f = linspace(0.5e9, 4e9, nFrequencies);
atom.selectedProject.physics.setFrequencyList(f');

%% mesh
atom.selectedProject.mesh.setGlobalMeshDensity('10');
atom.selectedProject.mesh.getMesh;
atom.selectedProject.mesh.plotMesh;

%% solve MoM
atom.selectedProject.solver.MoM2D.setProperties(...
   'nBatchMax', 2000, ...
   'quadOrder', 1, ...   
   'resultRequests', 'basisFcns, mesh, iVec, vVec, zInActive');
atom.selectedProject.solver.MoM2D.solve();

%% input impedance
R = real(atom.selectedProject.solver.MoM2D.results.zInActive.data);
X = imag(atom.selectedProject.solver.MoM2D.results.zInActive.data); 

figure;
hold on;
plot(f./1e9,R,'b');
plot(f./1e9,X,'r');
xlabel('f [GHz]');
ylabel('Z_{in} [\Omega]');
legend('R (AToM)', 'X (AToM)');
grid on;

%% return loss
load(fullfile(pwd, 'data', 'CP_Antenna', 'results_CST.mat'));
Z = R + 1j.*X;
Z0 = 50;
RC = (Z0-Z)./(Z0+Z);
RL = 20.*log10(abs(RC));
figure;
hold on;
plot(f./1e9, RL,'b');
plot(f_CST, S_CST,'r');
xlabel('f [GHz]');
ylabel('RL [dB]');
legend('RL (AToM)', 'RL (CST)');
grid on;

%% end session
atom.exit;