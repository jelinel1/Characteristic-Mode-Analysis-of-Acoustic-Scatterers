%% MoM1D_Ex1_Dipole
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Pavel Hazdra, CTU in Prague, pavel.hazdra@antennatoolbox.com
% (c) 2017, Vladimir Sedenka, BUT, vladimir.sedenka@antennatoolbox.com


clc; close all; clear all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);


%% Geometry
L = 1; % length of dipole
radius1 = L/500; % we test different radiuses
radius2 = L/1000;
radius3 = L/5000;
atom.selectedProject.geom.addLine([-L/2, 0, 0; L/2, 0, 0], 'Line');

%% Physics
frequencyList = linspace(1e8, 3e9, 100);
atom.selectedProject.physics.setFrequencyList(frequencyList);

% atom.selectedProject.physics.feeding.addPlaneWave('linear_wave', ...
%    'axialRatio', Inf, 'direction', 'left', ...
%    'propagationVector', '[0 0 1]', ...
%    'initElectricField', '[1 0 0]');
% atom.selectedProject.physics.feeding.addPlaneWave('linear_wave2', ...
%    'axialRatio', Inf, 'direction', 'left', ...
%    'propagationVector', '[0 0 1]', ...
%    'initElectricField', '[1 0 0]');


%% Mesh

atom.selectedProject.mesh.setGlobalMeshDensity(3e8/max(frequencyList)/(L/100))

atom.selectedProject.physics.feeding.add1DDiscretePort(1, 'base', 'Line', ...
   'pos', 0.5);

atom.selectedProject.physics.feeding.editFeeder(1, 'isEnable', true);

atom.selectedProject.mesh.getMesh();
% see table with list of ports
% table1 = atom.selectedProject.physics.feeding.table.discrete1DPorts;

atom.selectedProject.solver.MoM1D.setProperties(...
   'quadOrder', 3, ...
   'resultRequests', 'mesh, basisFcns, zMat, iVec, zInActive',...
   'wireRadius', radius1, ...
   'nWorkers', 0);
atom.selectedProject.solver.MoM1D.solve();
r1 = atom.selectedProject.solver.MoM1D.results;

atom.selectedProject.solver.MoM1D.setProperties(...
   'quadOrder', 3, ...
   'resultRequests', 'mesh, basisFcns, zMat, iVec, zInActive',...
   'wireRadius', radius2, ...
   'nWorkers', 0);
atom.selectedProject.solver.MoM1D.solve();
r2 = atom.selectedProject.solver.MoM1D.results;


atom.selectedProject.solver.MoM1D.setProperties(...
   'quadOrder', 3, ...
   'resultRequests', 'mesh, basisFcns, zMat, iVec, zInActive',...
   'wireRadius', radius3, ...
   'nWorkers', 0);
atom.selectedProject.solver.MoM1D.solve();
r3 = atom.selectedProject.solver.MoM1D.results;

Zin_radius1 = r1.zInActive.data;
Zin_radius2 = r2.zInActive.data;
Zin_radius3 = r3.zInActive.data;


% column 1 = frequency
% column 2 = Zin, radius = L/500
% column 3 = Zin, radius = L/1000
% column 4 = Zin, radius = L/5000
load(fullfile('data', '1D_dipole', 'results_FEKO'));

fFEKO = real(Z_FEKO(:,1));

figure('Name', 'Input impedance a = L/500');
hold on;
plot(frequencyList,real(Zin_radius1),'b','LineWidth',2);
plot(frequencyList,imag(Zin_radius1),'r','LineWidth',2);
plot(fFEKO,real(Z_FEKO(:,2)),'b');
plot(fFEKO,imag(Z_FEKO(:,2)),'r');

legend('R AToM', 'X AToM',...
       'R FEKO', 'X FEKO');   
title('Driving impedance, a = L/500');
grid on;
xlabel('f [Hz]');
ylabel('Z [\Omega]');

figure('Name', 'Input impedance a = L/1000');
hold on;
plot(frequencyList,real(Zin_radius2),'b','LineWidth',2);
plot(frequencyList,imag(Zin_radius2),'r','LineWidth',2);
plot(fFEKO,real(Z_FEKO(:,3)),'b');
plot(fFEKO,imag(Z_FEKO(:,3)),'r');

legend('R AToM', 'X AToM',...
       'R FEKO', 'X FEKO');   
title('Driving impedance, a = L/1000');
grid on;
xlabel('f [Hz]');
ylabel('Z [\Omega]');

figure('Name', 'Input impedance a = L/5000');
hold on;
plot(frequencyList,real(Zin_radius3),'b','LineWidth',2);
plot(frequencyList,imag(Zin_radius3),'r','LineWidth',2);
plot(fFEKO,real(Z_FEKO(:,4)),'b');
plot(fFEKO,imag(Z_FEKO(:,4)),'r');

legend('R AToM', 'X AToM',...
       'R FEKO', 'X FEKO');   
title('Driving impedance, a = L/5000');
grid on;
xlabel('f [Hz]');
ylabel('Z [\Omega]');

%% end session
atom.exit;


