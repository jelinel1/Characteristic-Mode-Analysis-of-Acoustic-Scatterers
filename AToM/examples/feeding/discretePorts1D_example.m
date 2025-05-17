%% discretePorts1D_example shows Feeding capabilities with 1D discrete ports.
% This script shows all public Feeding capabilities with 1D discrete ports.
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

%% adding geometry
% it is not possible to created discrete port without geometry
% add lines
atom.selectedProject.geom.addLine('[0 0 0; -1 -0.5 2]', 'line1');
atom.selectedProject.geom.addLine('[0 0 0; 1 1 1]', 'line2');
% add ellipse arc
atom.selectedProject.geom.addEllipseArc(...
   [0 0 0], [2 0 0], [0 1 0], 0, pi, 'ellipse1');
% add parallelogram frame
atom.selectedProject.geom.addParallelogramFrame([0, 0, 0], ...
   [2, 0, 0], [1 1 0], 'parallelo');
% add equation curve
atom.selectedProject.geom.addEquationCurve( ...
   '@(t) sin(t) + 1', '@(t) t - 2', '@(t) 0*t', [0 2*pi], 'eqCurve');

%% add variabes to workspace
% variable 'pos_a' will be used as parametried position of port on 1D geometry
% object. Value has to lie in inteval <0, 1>
% position parameter mean fraction of curvature from start point
atom.selectedProject.workspace.addVariable('pos_a', 0.4)
atom.selectedProject.workspace.addVariable('pos_b', 0.6)

%% add default 1D discrete port number 1
% it is mandatory to specify port number, base object and port position
% default description = ''
atom.selectedProject.physics.feeding.add1DDiscretePort(1, ...
   'baseObjName', 'line1', 'positionPar', 'pos_a');

%% see table with list of ports
table1 = atom.selectedProject.physics.feeding.table.discrete1DPorts

%% add port 2 also to line1
% it is not neccessary write whole property name baseObjName and positionPar
% position is setted in 3D global coordinates (1/4 length of line1)
atom.selectedProject.physics.feeding.add1DDiscretePort(2, 'base', 'line1', ...
   'pos', '[-0.25 -0.125 0.5]');

%% add port 3 to ellipse
% positionPar value is taken from workspace's variable 'pos_a'
atom.selectedProject.physics.feeding.add1DDiscretePort(3, 'base', 'ellipse1', ...
   'pos', 'pos_a');

%% add port 4 to parallelogram frame
% it is not neccessary to write whole property name description
% in the center of object by default
atom.selectedProject.physics.feeding.add1DDiscretePort(4, 'base', 'parallelo', ...
   'position', 0.5, 'descr', 'Port on parallelogram frame');

%% add port 5 to equation curve
atom.selectedProject.physics.feeding.add1DDiscretePort(5, 'base', 'eqCurve', ...
   'descr', 'Port on eq. curve', 'pos', 'pos_b');

%% see table with all ports
table2 = atom.selectedProject.physics.feeding.table.discrete1DPorts
%% edit port 4
% change base object of port 4 to equation curve
atom.selectedProject.physics.feeding.editPort(4, 'base', 'eqCurve', ...
   'descr', 'New port on eq. curve');
% two ports are connected to equation curve now
table3 = atom.selectedProject.physics.feeding.table.discrete1DPorts

%% Edit expression of variable pos_a
% ports 2 and 3 will have different positions
atom.selectedProject.workspace.editExpression('pos_a', 0.3);
table4 = atom.selectedProject.physics.feeding.table.discrete1DPorts

%% delete equation curve
atom.selectedProject.geom.deleteObject('eqCurve');
% ports from equation curve will be also deleted
table5 = atom.selectedProject.physics.feeding.table.discrete1DPorts

%% delete port 2 and 3
atom.selectedProject.physics.feeding.deletePort([2, 3])
table6 = atom.selectedProject.physics.feeding.table.discrete1DPorts

%% save project and close it and open again
atom.selectedProject.save;
atom.closeProject;
atom.openProject(fileName);
% ports are loaded from HDF file
table7 = atom.selectedProject.physics.feeding.table.discrete1DPorts

%% Quit
atom.quit;