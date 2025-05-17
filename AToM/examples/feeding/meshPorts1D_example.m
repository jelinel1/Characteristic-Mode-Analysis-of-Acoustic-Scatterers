%% meshPorts1D_example shows Feeding capabilities with 1D mesh ports.
% This script shows all public Feeding capabilities with 1D mesh ports.
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
% add lines
atom.selectedProject.geom.addLine([0 0 0; 1 1 1], 'line1');
atom.selectedProject.geom.addLine([0 0 0; -1 -0.5 1], 'line2');
atom.selectedProject.geom.addLine([0 0 0; -1 -1 -1], 'line3');

%% set frequency points
atom.selectedProject.physics.setFrequencyList((1:10)*1e9);

%% set density of mesh
c0 = 3e8;
atom.selectedProject.mesh.setGlobalMeshDensity(c0/10e9/0.2)

atom.selectedProject.mesh.getMesh;

%% add 1D mesh port number 1
% specify number of port and elements is mandatory
% default values of port without another specifications:
% description = ''
atom.selectedProject.physics.feeding.add1DMeshPort(1, 'elements', [1 2]);

%% see table with list of ports
table1 = atom.selectedProject.physics.feeding.table.meshPorts1D

%% add port 2 also to line1
% it is not neccessary write whole property name elements and description
% add port between elements 4 and 3
% these elements has common node number 4
atom.selectedProject.physics.feeding.add1DMeshPort(2, 'elements', [4, 3], ...
   'descript', 'second port');

%% see table with all ports
table2 = atom.selectedProject.physics.feeding.table.meshPorts1D
%% edit port 1
% change description and elements of the first port
atom.selectedProject.physics.feeding.editPort(1, 'ele', [2 1], ...
   'descr', 'first port');
% two ports are connected to equation curve now
table3 = atom.selectedProject.physics.feeding.table.meshPorts1D

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

%% delete port 2
atom.selectedProject.physics.feeding.deletePort(2)
table8 = atom.selectedProject.physics.feeding.table.meshPorts1D

%% save project and close it and open again
atom.selectedProject.save;
atom.closeProject;
atom.openProject(fileName);
% ports are loaded from HDF file
table9 = atom.selectedProject.physics.feeding.table.meshPorts1D

%% Quit
atom.quit;