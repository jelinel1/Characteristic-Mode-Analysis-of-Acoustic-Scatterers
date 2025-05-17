%% portFixPoint1D shows how to 1D discrete ports
% This script shows how to create geometry with 1D discrete ports.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com

clear
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
atom.selectedProject.geom.addLine('[0 0 0; 1 1 0]', 'line1');

%% add variabes to workspace
% these variables will be used as parameter for position of port on 1D geometry
% object. Value has to lie in inteval <0, 1>
atom.selectedProject.workspace.addVariable('pos_a', 0.7);

%% add port 1 also to line1
% it is not neccessary write whole property name baseObjName and positionPar
% positionPar value is taken from workspace's variable 'pos_a'
atom.selectedProject.physics.feeding.add1DDiscretePort(1, 'base', 'line1', ...
   'pos', 'pos_a');

table6 = atom.selectedProject.physics.feeding.table.discrete1DPorts;

%% calculate Mesh
atom.selectedProject.mesh.getMesh();

%% calculate nearby elements
a = atom.selectedProject.physics.feeding.table.discrete1DPorts.Position;

%%
atom.selectedProject.mesh.plot();

%% 
atom.exit;