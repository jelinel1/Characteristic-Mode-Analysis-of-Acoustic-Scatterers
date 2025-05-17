%% portFixPoint2D shows how to get nearby elements of discrete port
% This script shows how to use function getTriangleNumber.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com

clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% adding 2D geometry
% it is not possible to created discrete port without geometry
% add parallelogram and ellipse
% atom.selectedProject.geom.addParallelogram([-1, -1, 0], [1, -1, 0], [-1, 1, 0], ...
%    'rectangle');
atom.selectedProject.geom.addEllipse([2 2 0], [2 4 0], [3 2 0], 0, 2*pi, ...
   'ellipse');

atom.selectedProject.geom.addEllipse([2 2 2], [2 4 2], [3 2 2], 1, 2*pi, ...
   'ellipse2');
%% add variabes to workspace
% these variables will be used as parameter for position of port on 1D geometry
% object. Value has to lie in inteval <0, 1>
atom.selectedProject.workspace.addVariable('position', '[0 0.255; 0.0 1]')


%% add port 1 to ellipse
% it is not neccessary write whole property name baseObjName and positionPar
% positionPar value is taken from workspace's variable 'position'
% ellipse is formed with angle in interval <0, 2*pi>. Port will be relatively in
% angles 0.25 - 0.75 and distance from center will be 0.5.
atom.selectedProject.physics.feeding.add2DDiscretePort(1, ...
   'base', 'ellipse', 'pos', 'position');

table1 = atom.selectedProject.physics.feeding.table.discrete2DPorts

atom.selectedProject.mesh.setLocalMeshDensity('ellipse',1);
atom.selectedProject.mesh.setUseLocalMeshDensity( 'ellipse', true);

atom.selectedProject.mesh.setLocalMeshDensity('ellipse2',1.5);
atom.selectedProject.mesh.setUseLocalMeshDensity( 'ellipse2', true);

atom.selectedProject.mesh.getMesh;
atom.selectedProject.mesh.plotMesh;

%% plot discretePort border nodes
a = atom.selectedProject.physics.feeding.table.discrete2DPorts.Position;
b = str2num(a{1});
hold on;
plot3(b(:,1),b(:,2),b(:,3), 'xb', 'MarkerSize', 10, 'LineWidth', 2.5);
plot3(b(:,1),b(:,2),b(:,3),'-b', 'LineWidth', 1.5);

%%
atom.exit;