%% simple example to run GEP without AToM with loaded zMat of dipole
%
% See also functions myCustomInnerSolver.m and myCustomInnerSolverSolve.m
clear;clc;close all;

%% frequency list
%note: at this frequency list was computed loaded zMatrix
frequencyList = linspace(0.5e9, 1.5e9, 21);

%% precomputing input matrices
% can be loaded from file, here are computed by MoM
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');
atom = Atom.start(false);
atom.createProject(fileName);
atom.selectedProject.geom.addRectangle('[0 0 0]', '1', '0.05', 'z', ...
   'Rectangle1');
atom.selectedProject.mesh.setUseUniformTriangulation(true);
atom.selectedProject.mesh.setElementSizeFromFrequency(false);
atom.selectedProject.mesh.setUniformMeshType('right');
atom.selectedProject.mesh.setGlobalMeshDensity('0.05');
atom.selectedProject.mesh.getMesh();
atom.selectedProject.physics.setFrequencyList(frequencyList);
atom.selectedProject.solver.MoM2D.solve;
zMat = atom.selectedProject.solver.MoM2D.results.zMat.data;
atom.quit;

%% create and set GEP object
myGEP = models.solvers.GEP.GEP();
myGEP.setProperties(...
   'nModes', 20,...
   'innerSolver', 'empty',...
   'charAngleBoundaryTop', 240,...
   'charAngleBoundaryBottom', 120);

%% set input matrices (3 ways)

% way 1:
myGEP.setMatrixA(imag(zMat));
myGEP.setMatrixB(real(zMat));
% way 2:
% myGEP.setMatrix('A',imag(zMat));
% myGEP.setMatrix('B',real(zMat));
% % way3:
% myGEP.setMatrixes(imag(zMat),real(zMat),[]);

%% solve
myGEP.solve(frequencyList);

%% compute and plot eigAngle
eigAngle = results.calculateCharacteristicAngle(...
   myGEP.results.eigNum.sorted.data);
handles = results.plotCharacteristicAngle('frequency', ...
   myGEP.frequencyList, 'characteristicAngle', eigAngle);