%% Spherical dipole simultaneously fed by three one-edge voltage gaps
%% Obtain voltage at fourth port with complex load impedance
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


%% Setup ports (search for triangles in the plane z=0)
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

%% Set ports and load
port1Triangles = [Tr_plus(1) Tr_minus(1)]; % excitation
port2Triangles = [Tr_plus(2) Tr_minus(2)]; % load
port3Triangles = [Tr_plus(3) Tr_minus(3)]; % excitation
port4Triangles = [Tr_plus(4) Tr_minus(4)]; % excitation

atom.selectedProject.physics.feeding.add2DMeshPort(1, ...
   'elements', port1Triangles, ...
   'description', '');

atom.selectedProject.physics.feeding.editFeeder(1, ...
   'isEnabled', true, ...
   'type', 'voltage', ...
   'value', '1');

atom.selectedProject.physics.feeding.add2DMeshPort(3, ...
   'elements', port3Triangles, ...
   'description', '');

atom.selectedProject.physics.feeding.editFeeder(3, ...
   'isEnabled', true, ...
   'type', 'voltage', ...
   'value', '1');

atom.selectedProject.physics.feeding.add2DMeshPort(4, ...
   'elements', port4Triangles, ...
   'description', '');

atom.selectedProject.physics.feeding.editFeeder(4, ...
   'isEnabled', true, ...
   'type', 'voltage', ...
   'value', '1');

Zload = 100-i*30; % load impedance at +y arm
ZL = repmat([Zload, 0], numel(frequencyList), 1);

atom.selectedProject.physics.feeding.add2DMeshPort(2, ...
   'elements', port2Triangles, ...
   'description', '');

atom.selectedProject.physics.feeding.editLumpedCircuit(2, ...
   'isEnabled', true, ...
   'type', 'ser', ...
   'R', 'NaN', ...
   'L', 'NaN', ...
   'C', 'NaN', ...
   'userImpedance', ZL);

%% Solution
% MoM solver
atom.selectedProject.solver.MoM2D.setProperties(...
   'nBatchMax', 2000, ...
   'quadOrder', 1, ...   
   'resultRequests', 'basisFcns, mesh, iVec, vVec, zInActive');
atom.selectedProject.solver.MoM2D.solve();

% Get current at load and calculate voltage at load
mesh = atom.selectedProject.mesh.getMeshData2D;
basisFcns = atom.selectedProject.solver.MoM2D.results.basisFcns;
[tf, IDbasisFcn] = ismember(sort(port2Triangles, 2), sort(basisFcns.data(:,...
   [basisFcns.Col.trianglePlus, basisFcns.Col.triangleMinus]), 2), 'rows');

edgeLength = mesh.triangleEdgeLengths(basisFcns.data(IDbasisFcn,basisFcns.Col.edge));
CurrentAtPort = edgeLength*atom.selectedProject.solver.MoM2D.results.iVec.data(IDbasisFcn,:);
InducedVoltage = Zload.*CurrentAtPort;

Z = atom.selectedProject.solver.MoM2D.results.zInActive.data;

R = real(atom.selectedProject.solver.MoM2D.results.zInActive.data(1,:));
X = imag(atom.selectedProject.solver.MoM2D.results.zInActive.data(1,:)); 


%% Compare with FEKO
load(fullfile('data', 'helix4arms_1608', 'results_FEKO_Uind'));

% frequency list for feko
nFreq = 500;
f = linspace(0.01e9, 10e9, nFreq);

figure;
hold on;
plot(frequencyList, -real(InducedVoltage),'b','LineWidth',2);
plot(frequencyList, -imag(InducedVoltage)','r','LineWidth',2);
plot(frequencyList, abs(InducedVoltage)','k','LineWidth',2);
plot(f, U_FEKO(:,1),'b');
plot(f, U_FEKO(:,2),'r');
plot(f, sqrt(U_FEKO(:,1).^2+U_FEKO(:,2).^2),'k');
xlabel('f [Hz]');ylabel('U_{load}');
legend('Re(U) AToM', 'Im(U) AToM','|U| AToM','Re(U) FEKO', 'Im(U) FEKO','|U| FEKO');
grid on;

%% end session
atom.exit;