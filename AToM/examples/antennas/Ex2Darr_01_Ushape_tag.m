%% Create one element of array and sweep its dimensions, mesh is created
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com

clc; close all;

%% Prepare session 
% if OOP instance and/or file exist, delete them
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

% start AToM
atom = Atom.start(true);
atom.createProject('Ex2Darr_01_Ushape_tag');

%% Workspace - Variables
Lx = 1;
Ly = 1/4;
Gx = 1/4;
Gy = 1/10;
fList = 'linspace(2e8, 4e8, 21)';
% add necessary variables to the AToM Workspace
atom.selectedProject.workspace.addVariable('Lx', Lx);
atom.selectedProject.workspace.addVariable('Ly', Ly);
atom.selectedProject.workspace.addVariable('Gx', Gx);
atom.selectedProject.workspace.addVariable('Gy', Gy);
atom.selectedProject.workspace.addVariable('c0', 'models.utilities.constants.c0');
atom.selectedProject.workspace.addVariable('fList', fList);

%% Geometry - Create dipole1, dipole2, and connection between dipole1
atom.selectedProject.geom.addParallelogram('[-Lx/2,-Gy/2,0]', ...
                                           '[-Lx/2+Gx,-Gy/2,0]', ...
                                           '[-Lx/2,Gy/2,0]', 'Dip1');
atom.selectedProject.geom.addParallelogram('[-Lx/2,Gy/2,0]', ...
                                           '[Lx/2,Gy/2,0]', ...
                                           '[-Lx/2,Gy/2+Ly,0]', 'Dip2');                                        
atom.selectedProject.geom.addParallelogram('[-Lx/2,-Gy/2-Ly,0]', ...
                                           '[Lx/2,-Gy/2-Ly,0]', ...
                                           '[-Lx/2,-Gy/2,0]', 'Con');
% boolean operations
atom.selectedProject.geom.boolean.unite('Dip1', 'Dip2');
atom.selectedProject.geom.boolean.unite('Dip1', 'Con');

% atom.selectedProject.physics.symmetryPlanes.XZ.setType('electric');
atom.selectedProject.physics.setFrequencyList('fList');

%% Discretization - Mesh grid (2 triangles per the smallest dimension)
atom.selectedProject.mesh.setUseLocalMeshDensity('Dip1', true)
atom.selectedProject.mesh.setLocalMeshDensity('Dip1', 'c0/max(fList)/min([Lx Ly Gx Gy]/2)');
atom.selectedProject.mesh.getMesh;
% set mesh on fly to true > mesh will be regenerated after each modification
atom.selectedProject.mesh.setProperties('meshOnFly', 1);

%% GUI - Open DesignViewer GUI dialog
atom.gui.designViewer.open;
% set point of view
atom.gui.designViewer.setViewDirection('top');
% set layer (mesh)
atom.gui.designViewer.showMesh;

%% Set physics
atom.selectedProject.physics.feeding.addPlaneWave(...
   'PlaneWave1', 'propagationVector', [0 0 -1], 'initEl', [1 0 0]);
atom.selectedProject.solver.MoM.setup.setProperties(...
   'quadOrderList', 4, ...
   'outputPatterns', 'basic', ...
   'outputVariables', 'zMat, Jx, Jy, Jz');

%% Let's try to parametrize things and check mesher and other tools...
parName = 'Lx';
parNew  = linspace(1.5, 0.1, 3);
for thisPar = parNew
   atom.selectedProject.workspace.editExpression(parName, thisPar);
   pause(0.5);   
   drawnow
   % get grid (if one needs numerical data)
%    p = atom.selectedProject.mesh.nodes;
%    t = atom.selectedProject.mesh.elements.tri3;
end

%% Start MoM solver (now, at least for one mesh grid):
atom.selectedProject.solver.MoM.solve();