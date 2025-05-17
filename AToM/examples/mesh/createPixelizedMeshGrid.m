%% createPixelizedMeshGrid shows how to create mesh without starting AToM
%
% Included in AToM, info@antennatoolbox.com
% (c) 2020, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com

%% A thin strip dipole
nL = 100;     % number of pixels per length of a dipole (integer number!)
nW = 1;       % number of pixels per width of a dipole  (integer number!)

dx = 1/nL; % size of one pixel, e.g., overall length is dx*NL

PX = 2*ones(nL, nW); % create pixel mask
[~, ~, Mesh] = models.utilities.meshPublic.pixelGridToOrthoMesh(PX, dx);
results.plotMesh(Mesh); % plot result

%% A plate with pixelized holes, connections remeshed
nL = 13;     % number of pixels per length of a dipole (integer number!)
nW = 7;      % number of pixels per width of a dipole  (integer number!)

PX = 1*ones(nL, nW); % define plate
PX(2:2:end-1, 2:2:end-1) = 0; % create holes
PX(1:2:end,1:2:end) = 2;

[~, ~, Mesh] = models.utilities.meshPublic.pixelGridToOrthoMesh(PX);
results.plotMesh(Mesh); % plot result