%% Input impedance of a Yagi Uda antenna
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
frequencyList = linspace(1e7, 7.1e8, nFrequencies);

atom.selectedProject.physics.setFrequencyList(frequencyList);

% Load mesh and set port
atom.selectedProject.mesh.importMesh(fullfile(pwd, 'data', 'YagiUda', 'yagi_scaled.nas'));


%% Find triangles at the z=0 plane to setup port
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

portTriangles = [Tr_plus(2) Tr_minus(2)] ; % center of the second element

atom.selectedProject.physics.feeding.add2DMeshPort(1, ...
   'elements', portTriangles, ...
   'description', '');

atom.selectedProject.physics.feeding.editFeeder(1, ...
   'isEnabled', true, ...
   'type', 'voltage', ...
   'value', '1');

atom.selectedProject.solver.MoM2D.setProperties('nBatchMax', 2000, ...
'quadOrder', 1, 'resultRequests',...
    'basisFcns, mesh, zInActive, Jx, Jy, Jz, iVec, vVec');

atom.selectedProject.solver.MoM2D.solve();

%% Plot input impedance, compare with CEM One
R = real(atom.selectedProject.solver.MoM2D.results.zInActive.data);
X = imag(atom.selectedProject.solver.MoM2D.results.zInActive.data); 

load(fullfile('data', 'YagiUda', 'Results_CEM.mat'));

figure('Name', 'Input impedance');
hold on;
plot(frequencyList, R,'b','LineWidth',1);
plot(frequencyList, X,'r','LineWidth',1);
plot(fCEM,CEM_R,'b--','LineWidth',2);
plot(fCEM,CEM_X,'r--','LineWidth',2);   
legend('R (AToM)','X (AToM)','R (CEM)','X (CEM)');
title('Input impedance');
ylim([-3000 3000]);
grid on;
xlabel('f [Hz]');
ylabel('Z [\Omega]');


%% calculate and plot far-field
basisFcns = atom.selectedProject.solver.MoM2D.results.basisFcns;
mesh      = atom.selectedProject.solver.MoM2D.results.mesh;
iVec      = atom.selectedProject.solver.MoM2D.results.iVec.data;
farFieldStructure = results.calculateFarField(mesh, frequencyList(20), ...
'basisFcns', basisFcns, 'theta', linspace(0, pi, 200), ...
'phi', linspace(0, 2*pi, 400), 'iVec', iVec(:, 20));

handles2 = results.plotFarField('mesh', mesh, 'basisFcns', basisFcns, ...
'iVec', iVec(:, 20), 'frequency', frequencyList(20));
handles = results.plotFarField('theta', linspace(0, pi, 200), ...
'phi' , linspace(0, 2*pi, 400), 'farField', farFieldStructure.D);

%% end session
atom.exit;