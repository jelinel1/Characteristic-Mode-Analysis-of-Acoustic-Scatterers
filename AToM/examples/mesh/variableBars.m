clc; 
clear; 
close all;

%%
numRectangles = 2;    % number of rectangle per one vertical stub
numHolesPerLine = 19; % number of holes (without the middle one)
numRows = 4;          % number of rows (holes)
squareHeight = 0.5;   % size of init pixel

% To have Lx:Ly = 1
L = (2*numHolesPerLine + 1.5)*squareHeight;
x = (L - (numRows+1)*squareHeight) / (numRows*numRectangles);
rectangleHeight = x;


%% create primitives
squareNodes = [0 0 0; squareHeight 0 0; 0 squareHeight 0; squareHeight squareHeight 0];
squareConnectivity = [1 3 2; 4 2 3];
squareHalfNodes = [-squareHeight/2 0 0; 0 0 0; -squareHeight/2 squareHeight 0; 0 squareHeight 0];
squareHalfConnectivity = [1 3 2; 4 2 3];
rectangleNodes = [0 0 0; squareHeight 0 0; 0 rectangleHeight 0; squareHeight rectangleHeight 0];
rectangleConnectivity = [1 3 2; 4 2 3];

%% create horizontal bar
horizontalBarNodes = squareNodes;
horizontalBarConnectivity = squareConnectivity;

for n = 1:2*numHolesPerLine
   [newNodes] = models.utilities.meshPublic.translateMesh(squareNodes, ...
      [n*squareHeight 0 0]);
   [horizontalBarNodes, horizontalBarConnectivity] = models.utilities.meshPublic. ...
      uniteMeshes(horizontalBarNodes, horizontalBarConnectivity, newNodes, squareConnectivity);
end

%% create half square at the beggining of the bar
[horizontalBarNodes, horizontalBarConnectivity] = models.utilities.meshPublic. ...
      uniteMeshes(horizontalBarNodes, horizontalBarConnectivity, squareHalfNodes, squareHalfConnectivity);

%% copy horizontal bars
nodes = horizontalBarNodes;
connectivityList = horizontalBarConnectivity;

for n = 1:numRows
   [newNodes] = models.utilities.meshPublic.translateMesh(horizontalBarNodes, ...
      [0 n*(squareHeight+numRectangles*rectangleHeight) 0]);
   [nodes, connectivityList] = models.utilities.meshPublic. ...
      uniteMeshes(nodes, connectivityList, newNodes, horizontalBarConnectivity);
end

%% create vertical bars
verticalBarNodes = models.utilities.meshPublic.translateMesh(rectangleNodes, ...
   [0 squareHeight 0]);
verticalBarConnectivity = rectangleConnectivity;

for n = 1:numRectangles-1
   [newNodes] = models.utilities.meshPublic.translateMesh(rectangleNodes, ...
      [0 n*rectangleHeight+squareHeight 0]);
   [verticalBarNodes, verticalBarConnectivity] = models.utilities.meshPublic. ...
      uniteMeshes(verticalBarNodes, verticalBarConnectivity, newNodes, rectangleConnectivity);
end

%% create multiple vertical bars
barNodes = verticalBarNodes;
barConnectivity = verticalBarConnectivity;

for n = 1:numRows-1
   [newNodes] = models.utilities.meshPublic.translateMesh(verticalBarNodes, ...
      [0 n*(rectangleHeight*numRectangles+squareHeight) 0]);
   [barNodes, barConnectivity] = models.utilities.meshPublic. ...
      uniteMeshes(barNodes, barConnectivity, newNodes, verticalBarConnectivity);
end

%% copy vertical bars
verticalBarNodes = barNodes;
verticalBarConnectivity = barConnectivity;

for n = 1:numHolesPerLine
   [newNodes] = models.utilities.meshPublic.translateMesh(verticalBarNodes, ...
      [2*n*squareHeight 0 0]);
   [barNodes, barConnectivity] = models.utilities.meshPublic. ...
      uniteMeshes(barNodes, barConnectivity, newNodes, verticalBarConnectivity);
end

%% create resulting mesh
[nodes, connectivityList] = models.utilities.meshPublic. ...
   uniteMeshes(barNodes, barConnectivity, nodes, connectivityList);
% Starting mesh at (0,0) - because of symmetries
nodes(:,1) = nodes(:,1) + squareHeight/2;

mesh = models.utilities.meshPublic.getMeshData2D(nodes, connectivityList);
results.plotMesh(mesh);

%% export
models.utilities.meshPublic.exportNastran(nodes, [], connectivityList, [], '+data', 'bars')

%% import to AToM
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

atom = Atom.start(true);
atom.createProject(fileName);

mphName = fullfile(pwd, '+data', 'bars.nas');
atom.selectedProject.mesh.importMesh(mphName);

%% end session
atom.exit;
