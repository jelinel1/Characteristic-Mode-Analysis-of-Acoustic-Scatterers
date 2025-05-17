close all;
%% Initialize AToM, create geometry and mesh


%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);


%% create variables
atom.selectedProject.workspace.addVariable('L', 1, 'length')
atom.selectedProject.workspace.addVariable('W', 'L/2', 'width')

%% create Objects
myGeomObject = 'Rectangle';
atom.selectedProject.geom.addParallelogram('[-L/2, -W/2, 0] ', ...
   '[L/2, -W/2, 0]', '[-L/2, W/2, 0]', myGeomObject);
% fig = atom.selectedProject.geom.plot;

%% physics
frequencyList = linspace(1e8, 1e9, 2);
atom.selectedProject.physics.setFrequencyList(frequencyList);

%% create Mesh
% set MeshSize
atom.selectedProject.mesh.setGlobalMeshDensity(3);


%% see table with list of ports
% table1 = atom.selectedProject.physics.feeding.table.meshPorts2D
atom.selectedProject.mesh.getMesh;

%% solver

% set quadratures and output requests

atom.selectedProject.solver.MoM2D.setProperties('resultRequests', ...
   'basisFcns, mesh, Jx, Jy, Jz, iVec, zMat, zMatD, zMatE0'); % , iVec, uVec, zInActive, Jx

atom.selectedProject.solver.MoM2D.setProperties('quadOrder', 1);
atom.selectedProject.solver.MoM2D.solve();

%% end session
atom.exit;
