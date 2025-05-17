%% discretePorts2D_example shows Feeding capabilities with 2D discrete ports.
% This script shows all public Feeding capabilities with 2D discrete ports.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
% mcode

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
atom.selectedProject.geom.addParallelogram([-1, -1, 0], [1, -1, 0], [-1, 1, 0], ...
   'rectangle');

atom.selectedProject.geom.addParallelogram([-1 -1, 0], [0, -1, 0], [-1, 0, 0], ...
   'rectangle2');

atom.selectedProject.geom.addEllipse([2 2 0], [2 4 0], [3 2 0], 0, 2*pi, ...
   'ellipse');

%% add variabes to workspace
% these variables will be used as position of port on 2D geometry
% object. It is possible to define position of port in 3D global coordinates
% or as parametrized position (matrix [2 x 2] with value has from inteval <0, 1>)
% rows in matrix have this meaning:
% paralellogram: lowLeft = [0, 0], lowRight = [1, 0], highRight = [1, 1], etc.
%                ordinaryPos = [pos1. pos2]
atom.selectedProject.workspace.addVariable('position3D', '[2, 3, 0; 2, 1, 0]')
atom.selectedProject.workspace.addVariable('parPosition', '[0.25 0.75; 0.5 0.5]')

%% add default 2D discrete port number 1
% it is mandatory to specify port number, base object and port position
% default description = ''
atom.selectedProject.physics.feeding.add2DDiscretePort(1, 'base', 'rectangle', ...
   'position', [-0.75 -0.75 0; -0.75 -0.25 0]);

%% add port 2 to ellipse
% it is not neccessary write whole property name baseObjName and positionPar
% positionPar value is taken from workspace's variable 'position'
% ellipse is formed with angle in interval <0, 2*pi>. Port will be relatively in
% angles 0.25 - 0.75 and distance from center will be 0.5.
atom.selectedProject.physics.feeding.add2DDiscretePort(2, ...
   'base', 'ellipse', 'pos', 'position3D');

%% see table with list of ports
table1 = atom.selectedProject.physics.feeding.table.discrete2DPorts

%% edit port 1
% change base object to rectangle2 and change relative position of port
atom.selectedProject.physics.feeding.editPort(1, 'pos', 'eye(2)', ...
   'base', 'rectangle2', 'descr', 'Moved port');
% two ports are connected to rectangle2 now
table2 = atom.selectedProject.physics.feeding.table.discrete2DPorts

%% Edit expression of variable position
% port is in the center of ellipse and its length is 1/5 of major axis
atom.selectedProject.workspace.editExpression('parPosition', 'position3D');
table3 = atom.selectedProject.physics.feeding.table.discrete2DPorts

%% Delete rectangle2
% port 1 will be also deleted
atom.selectedProject.geom.deleteObject('rectangle2');
% ports from equation curve will be also deleted
table4 = atom.selectedProject.physics.feeding.table.discrete2DPorts

%% save project and close it and open again
atom.selectedProject.save;
atom.closeProject;
atom.openProject(fileName);
% ports are loaded from HDF file
table5 = atom.selectedProject.physics.feeding.table.discrete2DPorts

%% Quit
atom.quit;