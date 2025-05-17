clc; close all;

%% Example #1: Rectangular plate
Lx = 5;  % Number of pixels in x direction
Ly = 10; % Number of pixels in y direction

M = -1*ones(Lx, Ly);

[~, ~, Mesh] = models.utilities.meshPublic.pixelGridToOrthoMesh(M, 1);
results.plotMesh(Mesh);

%% Example #2: Rectangular loop
Lx = 10; % Number of pixels in x direction
Ly = 20; % Number of pixels in y direction

M = 1*ones(Lx, Ly);
M(2:end-1, 2:end-1) = 0;

[~, ~, Mesh] = models.utilities.meshPublic.pixelGridToOrthoMesh(M, 1);
results.plotMesh(Mesh);

%% Example #3: Pixel antenna
Px = 5;  % Number of pixels in x direction
Py = 10; % Number of pixels in y direction

Mx = 2*Px + 1;
My = 2*Py + 1;

M = 2*ones(Mx, My);
M(2:2:end, 2:2:end) = 0;

[~, ~, Mesh] = models.utilities.meshPublic.pixelGridToOrthoMesh(M, 1);
results.plotMesh(Mesh);

%% Example #4: Pixel antenna - mixed elements
Px = 5;  % Number of pixels in x direction
Py = 10; % Number of pixels in y direction

Mx = 2*Px + 1;
My = 2*Py + 1;

M = ones(Mx, My);
M(2:2:end, 2:2:end) = 0;
M(:, 1:5)           = -1*M(:, 1:5);
M(:, end-5:end)     = 2*M(:, end-5:end);

[~, ~, Mesh] = models.utilities.meshPublic.pixelGridToOrthoMesh(M, 1);
results.plotMesh(Mesh);

%% Conversion of mesh to pixels (e.g. to plot them in TikZ):
P = models.utilities.meshPublic.meshToPolygon(Mesh.nodes, Mesh.connectivityList);

fileName = 'AToM_Polygon';
Pl = length(P); % export all pixels separately
for ic = 1:Pl
    Data = P{ic};
    save([fileName '_' num2str(ic) '.tsv'], 'Data', '-ascii');
end