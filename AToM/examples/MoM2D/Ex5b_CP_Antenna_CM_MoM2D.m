%% MoM2D_Ex5b_CP_Antenna_CM Circularly polarized antenna in AToM w/o PEC GND, CM analysis
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
atom = Atom.start(true);
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

%% set and solve GEP
atom.selectedProject.solver.GEP.setProperties('innerSolver', 'CMs (MoM2D)');
atom.selectedProject.solver.GEP.setProperties('corrType', 'II');
atom.selectedProject.solver.GEP.setProperties('nModes', 10, 'AFSnInsertedSamples', 3, ...
    'AFSnIterations', 2, 'AFSresultsAtGivenSamples', false);
atom.selectedProject.solver.GEP.setProperties('AFSgoal', 'resonance');

atom.selectedProject.solver.GEP.solve();

%% get and plot eigenvalues
eigNum = atom.selectedProject.solver.GEP.results.eigNum.sorted.data;
eigAngle = results.calculateCharacteristicAngle(eigNum);
fE = atom.selectedProject.solver.GEP.frequencyList; % frequency list 
handles = results.plotCharacteristicAngle('frequency', fE, ...
   'characteristicAngle', eigAngle);

%% compare with CST
load(fullfile(pwd, 'data', 'CP_Antenna', 'modes_CST.mat'));

fCST  = modesCST(:,1);
m1CST = modesCST(:,2);
m2CST = modesCST(:,3);
m3CST = modesCST(:,4);
m4CST = modesCST(:,5);

figure;
hold on;
plot(fE./1e9,eigAngle(1,:),'b','Linewidth',2);
plot(fCST,m1CST,'b--','Linewidth',2);
plot(fE./1e9,eigAngle(2,:),'r','Linewidth',2);
plot(fCST,m2CST,'r--','Linewidth',2);
plot(fE./1e9,eigAngle(3,:),'k','Linewidth',2);
plot(fCST,m4CST,'k--','Linewidth',2);
plot(fE./1e9,eigAngle(4,:),'m','Linewidth',2);
plot(fCST,m3CST,'m--');
grid on;
xlabel('f [GHz]');ylabel('\alpha [\circ]');
legend('\alpha_1 (AToM)','\alpha_1 (CST)','\alpha_2 (AToM)','\alpha_2 (CST)',...
       '\alpha_3 (AToM)','\alpha_3 (CST)','\alpha_4 (AToM)','\alpha_4 (CST)');

%% end session
atom.exit;