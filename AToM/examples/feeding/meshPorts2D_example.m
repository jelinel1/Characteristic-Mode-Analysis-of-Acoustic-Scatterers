%% meshPorts2D_example shows Feeding capabilities with 2D mesh ports.
% This script shows all public Feeding capabilities with 2D mesh ports.
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

%% adding geometry and creating mesh
% make a frame
atom.selectedProject.geom.addParallelogram([2 1 0], ...
   [4 1 0], [2 2 0], 'Parallelogram1');
atom.selectedProject.geom.addParallelogram([2.2 1.2 0], ...
   [3.8 1.2 0], [2.2 1.8 0], 'Parallelogram2');
atom.selectedProject.geom.boolean.subtract('Parallelogram1', 'Parallelogram2');

%% Set frequency points
atom.selectedProject.physics.setFrequencyList('(1:5)*1e7');

%% Get mesh
atom.selectedProject.mesh.getMesh;

%% add default 2D mesh port number 1
% specify number of port and elements is mandatory
% default values of port without another specifications:
% description = ''
atom.selectedProject.physics.feeding.add2DMeshPort(1, 'elements', [7 33]);

%% see table with list of ports
table1 = atom.selectedProject.physics.feeding.table.meshPorts2D

%% add port 2 also to Parallelogram1
% it is not neccessary write whole property name elements and description
% add port between elements 14 and 16
% these elements has common node number 3 and 7
atom.selectedProject.physics.feeding.add2DMeshPort(2, 'elements', [14 16], ...
   'descript', 'second port');

%% see table with all ports
table2 = atom.selectedProject.physics.feeding.table.meshPorts2D
%% edit port 1
% change description and elements of the first port
atom.selectedProject.physics.feeding.editPort(1, 'ele', [10 12], ...
   'descr', 'first port');
% two ports are connected to equation curve now
table3 = atom.selectedProject.physics.feeding.table.meshPorts2D

%% turn on feeder on port 1

table4 = atom.selectedProject.physics.feeding.table.deltaGapFeeders
atom.selectedProject.physics.feeding.editFeeder(1, 'value', 2, 'isEnabled', true);
table5 = atom.selectedProject.physics.feeding.table.deltaGapFeeders

%% turn on lumper circuit on port 1

table6 = atom.selectedProject.physics.feeding.table.lumpedCircuits
atom.selectedProject.physics.feeding.editLumpedCircuit(1, 'isEnabled', true, ...
   'type', 'par', 'R', 50, 'L', '1e-9', 'C', NaN); % parallel RL circuit
table7 = atom.selectedProject.physics.feeding.table.lumpedCircuits

%% get values for solver
values = atom.selectedProject.physics.feeding.getPortValues
% only port 1 is returned, because port n. 2 has no allowed either circuit or
% feeder

%% delete port 2
atom.selectedProject.physics.feeding.deletePort(2)
table8 = atom.selectedProject.physics.feeding.table.meshPorts2D

%% save project and close it and open again
atom.selectedProject.save;
atom.closeProject;
atom.openProject(fileName);
% ports are loaded from HDF file
table9 = atom.selectedProject.physics.feeding.table.meshPorts2D

%% Quit
atom.quit;