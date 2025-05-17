%% lumpedCircuits_example shows work with lumped circuits on discrete ports.
% This script shows all public Feeding capabilities with lumped circuits on 
% discrete ports.
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
atom.selectedProject.geom.addLine('[0 0 0; -1 -1 -1]', 'line1');
atom.selectedProject.geom.addLine('[0 0 0; 1 1 1]', 'line2');

%% add default port number 1
% positionPar = 0.5; % center of the line
% description = ''
atom.selectedProject.physics.feeding.add1DDiscretePort(1, ...
   'baseObj', 'line1', 'position', '0.5');
atom.selectedProject.physics.feeding.add1DDiscretePort(2, ...
   'baseObj', 'line2', 'position', '0.5');

%% see table with list of lumped circuits
% every discrete port has one lumped circuits which is in series with
% delta gap. If the delta gap is not enabled, then discrete port represents
% just lumped circuit.
% default values of lumped circuit of just created port:
% type = 'ser' % elements R, L, C and userImpedance are in series
% R, L, C = NaN % NaN values means that element is not connected to circuit
% userImpedance = NaN % user impedance is not connected to circuit
% isEnabled = false % whole lumped circuit is not connected to port
table1 = atom.selectedProject.physics.feeding.table.lumpedCircuits

%% editing of lumped circuit
% It is not possible to add lumped circuit or delete them. It is possible just 
% to edit them. Lumped circuit is integral part of discrete port and it can be
% just dissconnect from port by setting isEnabled = false.

% turning lumoed circuit 'on', i.e. circuit will be connected to pert in series
% with delta gap.
% the firt argument is number of port and is mandatory
atom.selectedProject.physics.feeding.editLumpedCircuit(1, 'isEnabled', true)

%% Changing type of circuit to parallel circuit
% paralel RLC circuit and user impedance is in series with delta gap
atom.selectedProject.physics.feeding.editLumpedCircuit(1, 'type', 'par');

%% Changing values of R, L and C
% values has to be positive and finite scalar
% to disconnect element change its value to NaN

atom.selectedProject.physics.feeding.editLumpedCircuit(1, 'R', 50, ...
   'L', '1e-9', 'C', NaN);

%% See lumped circuits on discrete port with changes
table2 = atom.selectedProject.physics.feeding.table.lumpedCircuits

%% Set user impedance
% To incorporate user impedance in lumped circuits of discrete port it is it is 
% suitable to use workspace for definition of frequency list and user impedance
% matrix. UserImpedance has to be numeric matrix [n x 2] where in first column
% is frequency dependence of impedance and second column is derivative of
% impedance with respect to omega (angular frequency). This derivatives is used
% just when MoM solver is ued and derivative of impedance matrix is required.
% Hence if not needed, it is possible to define it just like vector of zeros.
% define variable with frequency range 1-10 GHz in 200 points
atom.selectedProject.workspace.addVariable('freq', 'linspace(1e9, 10e9, 200)')
% set frequency list to physics
atom.selectedProject.physics.setFrequencyList('freq');
% define variable with frequency dependence of impedance
% impedance of serial RLC circuit
atom.selectedProject.workspace.addVariable('R', 50);
atom.selectedProject.workspace.addVariable('L', 1e-12);
atom.selectedProject.workspace.addVariable('C', 0.47e-9);
% it is suitable to transpose vector omega
atom.selectedProject.workspace.addVariable('omega', '2*pi*freq''');
% calculate impedance of series RLC circuit
atom.selectedProject.workspace.addVariable('impedance', 'R + 1j*omega*L + 1./(1j*omega*C)');
% set derivative of impedance with respect to omega as zeros
atom.selectedProject.workspace.addVariable('impedanceDer', 'zeros(size(impedance))');
% set user impedance to lumped circuit in port n. 1 (matrix [n x 2])
% complete lumped circuit on port n. 1 will be this userImpedance in series with
% R and L from previous section
atom.selectedProject.physics.feeding.editLumpedCircuit(1, ...
   'userImpedance', '[impedance, impedanceDer]');

%% See lumped circuits on discrete port with changes
% now is connected user impedance in prallel with R and L
table3 = atom.selectedProject.physics.feeding.table.lumpedCircuits

%% Disconnect R and L from circuit in port n. 1
atom.selectedProject.physics.feeding.editLumpedCircuit(1, 'R', NaN, 'L', NaN)
% discrete port now act just like user impedance

%% It is possible to turn on delta gap on port n. 1
atom.selectedProject.physics.feeding.editFeeder(1, 'isEnabled', true)
% on port n. 1 is now enabled voltage delta gap in series with user impedance

%% Edit port n. 2 using variables from workspace
% add wanted varibles
atom.selectedProject.workspace.addVariable('R_val', 10)
atom.selectedProject.workspace.addVariable('C_val', '1/(2*pi*1e9*10)')
atom.selectedProject.workspace.addVariable('L_val', 1e-9)
atom.selectedProject.workspace.addVariable('isEnabled', true)
% edit lumped circuit
atom.selectedProject.physics.feeding.editLumpedCircuit(2, ...
   'isEnabled', 'isEnabled', 'R', 'R_val', 'L', 'L_val', 'isEnabled', 'isEnabled')

%% See lumped circuits on discrete ports with changes
table4 = atom.selectedProject.physics.feeding.table.lumpedCircuits

%% Deletion of port cause also deletion of lumped circuit on port

atom.selectedProject.physics.feeding.deletePort(1)

table5 = atom.selectedProject.physics.feeding.table.lumpedCircuits

%% Save project and close it and open again
atom.selectedProject.save;
atom.closeProject;
atom.openProject(fileName);
% ports are loaded from HDF file
table6 = atom.selectedProject.physics.feeding.table.lumpedCircuits

%% Quit
atom.quit;