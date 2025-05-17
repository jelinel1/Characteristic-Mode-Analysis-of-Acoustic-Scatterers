%% Spherical dipole simultaneously fed by four one-edge voltage gaps
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

%% Model setup
% physics
nFrequencies = 100;
frequencyList = linspace(0.01e9, 10e9, nFrequencies);
atom.selectedProject.physics.setFrequencyList(frequencyList);


% Load mesh
atom.selectedProject.mesh.importMesh(fullfile(pwd, 'data', 'helix4arms_1608', ...
   'mesh.nas'));

%% Setup ports (search for triangles in the z=0)
dim = 3; % dim = 1 for x, dim = 2 for y, etc...
pos = 0; % position along selected dimension (typically zero)

nodes = atom.selectedProject.mesh.nodes;
conList = atom.selectedProject.mesh.elements2D.connectivityList;
trCentr = atom.selectedProject.mesh.triangleCentroids;

Pt0    = find(nodes(:, dim) == pos);
Tr0    = find(sum(ismember(conList, repmat(Pt0, 3, 1)), 2) == 2);
Tr0_xC = trCentr(Tr0, dim);
Tr_plus  = Tr0(Tr0_xC > 0);
Tr_minus = Tr0(Tr0_xC < 0);

EPlus  = conList(Tr_plus,:);
EMinus = conList(Tr_minus,:);

gaps = size(EPlus, 1);
EP   = (1:gaps).';
EM   = nan(gaps, 1);
for ig = 1:gaps
    EM(ig) = find(sum(ismember(EMinus, repmat(EPlus(ig,:), gaps, 1)), 2) == 2);
end
EMinus = EMinus(EM,:);
Tr_minus = Tr_minus(EM);

for ig = 1:gaps
    atom.selectedProject.physics.feeding.add2DMeshPort(ig, 'elements', [Tr_plus(ig) Tr_minus(ig)], 'description', '');
    atom.selectedProject.physics.feeding.editFeeder(ig, 'isEnabled', true, 'type', 'voltage', 'value', '1');
end


%% Solution
% MoM solver
atom.selectedProject.solver.MoM2D.setProperties(...
   'nBatchMax', 2000, ...
   'quadOrder', 2, ...   
   'resultRequests', 'basisFcns, mesh, iVec, vVec, zInActive');
atom.selectedProject.solver.MoM2D.solve();

R = real(atom.selectedProject.solver.MoM2D.results.zInActive.data(1,:));
X = imag(atom.selectedProject.solver.MoM2D.results.zInActive.data(1,:)); 

%% Compare with FEKO and CEM

nFreq = 500;
f = linspace(0.01e9, 10e9, nFreq);

load(fullfile(pwd, 'data', 'helix4arms_1608', 'results_CEM'));
load(fullfile(pwd, 'data', 'helix4arms_1608', 'results_FEKO'));

% list for AToM results
frequencyList = linspace(0.01e9, 10e9, nFrequencies);
atom.selectedProject.physics.setFrequencyList(frequencyList);
% list for FEKO/CEM results
nFreq = 500;
f = linspace(0.01e9, 10e9, nFreq);

figure('Name', 'Input impedance');
hold on;
plot(frequencyList, R,'b','LineWidth',2);
plot(frequencyList, X,'r','LineWidth',2);
plot(f, real(Z_FEKO(1,:)),'b');
plot(f, imag(Z_FEKO(1,:)),'r');
plot(f, real(Z_CEM(1,:)),'b:');
plot(f, imag(Z_CEM(1,:)),'r:');
ylim([-4000, 4000]);
legend('R AToM', 'X AToM',...
       'R FEKO', 'X FEKO',...
       'R CEM', 'X CEM');   
title('Driving impedance');
grid on;
xlabel('f [Hz]');
ylabel('Z [\Omega]');

%% end session
atom.exit;