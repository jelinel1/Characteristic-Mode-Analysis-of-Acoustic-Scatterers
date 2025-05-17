%% simple example to run GEP using AToM with shape of Czechia as structure
clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create points of Polygon
atomPath = models.utilities.getAToMFolder;
temp1 = importdata(fullfile(atomPath, 'examples','geom','czech_rep.txt'));
temp2 = temp1(1:3:end,:); % pick only every third point of shape

points = [temp2, zeros(size(temp2, 1), 1)];
clear temp1 temp2

%% set frequency List
frequencyList = linspace(1e5, 10e5, 11)';
atom.selectedProject.physics.setFrequencyList(frequencyList);

%% create Polygon
atom.selectedProject.geom.addPolygon(points);
fig = atom.selectedProject.geom.plot;

atom.selectedProject.mesh.setGlobalMeshDensity(10);

atom.selectedProject.mesh.getMesh;
atom.selectedProject.mesh.plotMesh;

%% MoM
atom.selectedProject.solver.MoM2D.setProperties('nBatchMax', 100)

%% GEP
atom.selectedProject.solver.GEP.setProperties(...
   'innerSolver', 'CMs (MoM2D)',...
   'nModes', 25,...
   'corrType', 'II',...
   'charAngleBoundaryTop', 240,...
   'charAngleBoundaryBottom', 120);

atom.selectedProject.solver.GEP.solve();

%% handleses to GEP functions
myGEP = atom.selectedProject.solver.GEP;

%% compute and plot eigAngle
eigNum = myGEP.results.eigNum.unsorted.data;
results.plotCharacteristicAngle('frequency', frequencyList, ...
   'eigennumber', eigNum);

eigNum2 = myGEP.results.eigNum.sorted.data;
results.plotCharacteristicAngle('frequency', frequencyList, ...
   'eigennumber', eigNum2);
%% exit
atom.exit;