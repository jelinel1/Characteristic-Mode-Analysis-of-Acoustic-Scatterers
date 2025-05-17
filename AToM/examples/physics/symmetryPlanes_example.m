%% symmetryPlanes_example shows work with symmetry planes in physics.
% This script shows all public symmetry planes capabilities.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
% mcode

clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% Setting type of planes
% there are always three planes: XY, XZ, YZ
% possible types are: 'none', 'electric', 'magnetic' and 'geometric'

% set different type
atom.selectedProject.physics.symmetryPlanes.XY.setType('electric')
atom.selectedProject.physics.symmetryPlanes.XZ.setType('geometric')
atom.selectedProject.physics.symmetryPlanes.YZ.setType('magnetic')

% viewing planes:
planeXY = atom.selectedProject.physics.symmetryPlanes.XY
planeXZ = atom.selectedProject.physics.symmetryPlanes.XZ
planeYZ = atom.selectedProject.physics.symmetryPlanes.YZ

%% Quit
atom.quit;