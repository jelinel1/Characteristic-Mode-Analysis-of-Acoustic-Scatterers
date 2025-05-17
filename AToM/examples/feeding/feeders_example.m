%% feeders_example shows Feeding capabilities with feeders on discrete ports.
% This script shows all public Feeding capabilities with feeders on discrete 
% ports.
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
atom.selectedProject.geom.addLine('[0 0 0; -1 -1 -1]', 'line1');
atom.selectedProject.geom.addLine('[0 0 0; 1 1 1]', 'line2');

atom.selectedProject.geom.addParallelogram([0, 0, 0], [1, 0, 0], [0, 1, 0], ...
   'rectangle1');

%% add ports
% parametric position in the center of lines
atom.selectedProject.physics.feeding.add1DDiscretePort(1, 'baseObjName', 'line1', ...
   'position', 0.5);
atom.selectedProject.physics.feeding.add1DDiscretePort(2, 'baseObj', 'line2', ...
   'position', 0.5);

%% see table with list of feeders on 1D ports
% every discrete port has exatly one feeder
% default values of feeder on just created 1D port:
% class = DeltaGap
% type = 'voltage' % another possibilities are 'current' ans 'SPar'
% isEnabled = false % feeder is not active in simulation
% value = 1 % voltage or current or impedance value
table1 = atom.selectedProject.physics.feeding.table.deltaGapFeeders

%% editing feeders
% It is not possible to add feeders or delete them. It is possible just to
% edit them. In all cases, one dicrete port can contain only single feeder.

% turning feeder 'on'
% the first argument is number of port and is mandatory
atom.selectedProject.physics.feeding.editFeeder(1, 'isEnabled', true)

%% Changing direction of voltage
% feeder n. 1 is voltage type
% change of its 'value' means changing its voltage
% complex value means phase shift of voltage
% voltage delta gap has zero internal impedance

atom.selectedProject.physics.feeding.editFeeder(1, 'value', 1 + 1i*0.5)

%% Changing type of feeder
% change type of delta gap to 'current' (current source)

atom.selectedProject.physics.feeding.editFeeder(1, 'type', 'current')

%% Show list of feeders with changes
table2 = atom.selectedProject.physics.feeding.table.deltaGapFeeders

%% change delta gap on port n.2 to 'current' type
% current of source is 5 A
% enable this delta gap
atom.selectedProject.physics.feeding.editFeeder(2, 'type', 'current', ...
   'value', 5, 'isEnabled', true)

%% Show list of feeders with changes
table3 = atom.selectedProject.physics.feeding.table.deltaGapFeeders

%% it is possible to use workspace for parametrising feeders values
atom.selectedProject.workspace.addVariable('isEn', true);
atom.selectedProject.workspace.addVariable('dir', -1);
atom.selectedProject.workspace.addVariable('val', 'sqrt(5)');

atom.selectedProject.physics.feeding.editFeeder(2, 'type', 'voltage', ...
   'value', 'val', 'isEnabled', 'isEn');

table4 = atom.selectedProject.physics.feeding.table.deltaGapFeeders

%% deletion of port cause also deletion of feeder on port

atom.selectedProject.physics.feeding.deletePort(1)

table5 = atom.selectedProject.physics.feeding.table.deltaGapFeeders

%% save project and close it and open again
atom.selectedProject.save;
atom.closeProject;
atom.openProject(fileName);
% port are loaded from HDF file
table6 = atom.selectedProject.physics.feeding.table.deltaGapFeeders

%% Quit
atom.quit;