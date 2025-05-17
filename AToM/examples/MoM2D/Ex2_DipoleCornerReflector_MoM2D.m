%% Corner reflector excited with dipole
% last check: 21.8.2019 (Miloslav Capek)
% To run ccrrectly, press "F5". One has to be in the examples/MoM2D folder.
% 
%% Note: The number of mesh elements is too high to be run in free version
% (Please consider supporting the AToM team by buying the full release.)

close all;
clear;
clc;


%% Atom initialization
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

% Load mesh and set port
atom.selectedProject.mesh.importMesh(fullfile(pwd, 'data', 'dipolecorner', 'mesh_scaled.nas'));
portTriangles = [653 650] ; % center of the dipole

atom.selectedProject.physics.feeding.add2DMeshPort(1, ...
   'elements', portTriangles, ...
   'description', '');

atom.selectedProject.physics.feeding.editFeeder(1, ...
   'isEnabled', true, ...
   'type', 'voltage', ...
   'value', '1');

%% Model setup
% physics
nFrequencies = 60;
frequencyList = linspace(0.1e8, 1e9, nFrequencies);
atom.selectedProject.physics.setFrequencyList(frequencyList);


%% Solution
% MoM solver
atom.selectedProject.solver.MoM2D.setProperties(...
   'nBatchMax', 10000, ...
   'quadOrder', 2, ...   
   'resultRequests', 'basisFcns, mesh, iVec, vVec, zInActive');
atom.selectedProject.solver.MoM2D.solve();

%% Plot input impedance
R = real(atom.selectedProject.solver.MoM2D.results.zInActive.data);
X = imag(atom.selectedProject.solver.MoM2D.results.zInActive.data); 

load(fullfile('data', 'dipolecorner','results_CEM'));
f_CEM = Z_CEM(:,1);

figure('Name', 'Input impedance');
hold on;
plot(frequencyList, R,'b','LineWidth',2);
plot(frequencyList, X,'r','LineWidth',2);
plot(f_CEM,Z_CEM(:,2),'k--','LineWidth',2);
plot(f_CEM,Z_CEM(:,3),'g--','LineWidth',2);   
legend('R (AToM)','X (AToM)','R (CEM)','X (CEM)');
title('Input impedance');
ylim([-2000 2000]);
grid on;
xlabel('f [Hz]');
ylabel('Z [\Omega]');

%% end session
atom.exit;