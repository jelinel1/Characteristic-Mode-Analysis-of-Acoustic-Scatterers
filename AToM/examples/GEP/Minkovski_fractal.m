%% Minkowski_fractal - characteristic modes on complex structure
% All variables which are needed for fractal creation are in AToM Workspace.
clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% Open GUI
atom.gui.open;
drawnow
%% Define variables
% basic points
scalingFactor = 1e-3;
atom.selectedProject.workspace.addVariable('pts', ...
   [-50 -30;50 -30;50 30;-50 30].*scalingFactor);
% transformation matrix
atom.selectedProject.workspace.addVariable('trns', ...
   [1/5 0 0 1/3 0 0; ...
   0.45 0 0 0.45 27.5*scalingFactor 17.5*scalingFactor; ...
   0.45 0 0 0.45 27.5*scalingFactor -17.5*scalingFactor; ...
   0.45 0 0 0.45 -27.5*scalingFactor 17.5*scalingFactor; ...
   0.45 0 0 0.45 -27.5*scalingFactor -17.5*scalingFactor]);
% function for IFS - iterated function system
atom.selectedProject.workspace.addVariable('IFS', ...
   ' models.utilities.geomPublic.gen_ifs_fractal(pts,trns, 2)');

%% Creation of fractal
atom.selectedProject.workspace.addVariable('iPoly', []);
atom.selectedProject.workspace.addVariable('nPoly', 'length(IFS)');

nPoly = atom.selectedProject.workspace.getValue('nPoly');
% creating all parallelogram for fractal
for iPoly = 1:nPoly
   iPolyChar = int2str(iPoly);
   % names of # variables for every parallelogram
   varName1 = ['p1_', iPolyChar];
   varName2 = ['p2_', iPolyChar];
   varName3 = ['p3_', iPolyChar];
   % expressions of variables
   expressionVar1 = ['[IFS(1,:,', iPolyChar, ') 0]'];
   expressionVar2 = ['[IFS(2,:,', iPolyChar, ') 0]'];
   expressionVar3 = ['[IFS(4,:,', iPolyChar, ') 0]'];
   % adding variables to Workspace
   atom.selectedProject.workspace.addVariable(varName1, expressionVar1);
   atom.selectedProject.workspace.addVariable(varName2, expressionVar2);
   atom.selectedProject.workspace.addVariable(varName3, expressionVar3);
   % name of new parallelogram
   thisName = ['Parallelogram', iPolyChar];
   atom.selectedProject.geom.addParallelogram(...
      varName1, varName2, varName3, thisName);% lowLeft, lowRight, highLeft
   if iPoly > 1
      % boolean unite
      atom.selectedProject.geom.boolean.unite('Parallelogram1', thisName);
   end
   
   atom.gui.designViewer.fitView
   drawnow;
end

%% Mesh structure
atom.selectedProject.mesh.setGlobalMeshDensity(30);
atom.selectedProject.mesh.getMesh();

%% set frequency List
frequencyList = linspace(0.5e9, 3.0e9, 21)';
atom.selectedProject.physics.setFrequencyList(frequencyList);

%% GEP
atom.selectedProject.solver.GEP.setProperties(...
   'innerSolver', 'CMs (MoM2D)',...
   'AFSnIterations', 4,...
   'AFSgoal', 'crossing, endOfMode',...
   'nModes', 15,...
   'corrType', 'II',...
   'charAngleBoundaryTop', 240,...
   'charAngleBoundaryBottom', 120,...
   'AFSregionBoundaryTop', 240,...
   'AFSregionBoundaryBottom', 120);
%% GEP solve
atom.selectedProject.solver.GEP.solve();

%% Quit
atom.quit;