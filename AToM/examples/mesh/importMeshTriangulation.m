clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create nodes, connectivityList matrices and import them
nodes = [0   -0.7071         0
   -0.5000   -0.5000         0
   -0.2071   -0.5000         0
    0.2071   -0.5000         0
    0.5000   -0.5000         0
    0.1182   -0.2853         0
   -0.1125   -0.2716         0
   -0.5000   -0.2071         0
    0.5000   -0.2071         0
   -0.2853   -0.1182         0
    0.2716   -0.1125         0
         0         0         0
   -0.7071         0         0
    0.7071         0         0
   -0.2716    0.1125         0
    0.2853    0.1182         0
   -0.5000    0.2071         0
    0.5000    0.2071         0
    0.1125    0.2716         0
   -0.1182    0.2853         0
   -0.5000    0.5000         0
   -0.2071    0.5000         0
    0.2071    0.5000         0
    0.5000    0.5000         0
         0    0.7071         0];
     
connectivityList = [5     4     9
     9     4     6
    20    19    12
    20    23    19
    14     9    18
    18    23    24
    12     6     7
    15    20    12
    25    23    22
    23    20    22
    11     6    12
    11     9     6
     2     8     3
     3     4     1
     6     4     3
     3     7     6
    10     3     8
     7     3    10
    12     7    10
    10    15    12
    17     8    13
    17    10     8
    15    10    17
    21    22    17
    20    15    17
    17    22    20
    16    18     9
     9    11    16
    19    23    16
    23    18    16
    12    19    16
    16    11    12];

atom.selectedProject.mesh.import2DMesh(nodes, connectivityList, 'myMesh');

%% plot mesh
atom.selectedProject.mesh.plotMesh;
data = atom.selectedProject.mesh.getMeshData2D;

%% end session
atom.exit;