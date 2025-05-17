clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.initialize(false);
atom.createProject(fileName);

%% create points of Polygon
temp1 = importdata(fullfile('examples','geom','czech_rep.txt'));
points = [temp1, zeros(size(temp1, 1), 1)];

%% create Polygon
atom.selectedProject.geom.addPolygon(points);

%% create Hole
a = [270.9288
  265.1387
  265.1387
  269.4813
  273.1001
  275.2714
  283.9566
  284.6803
  293.3655
  293.3655
  300.6031
  307.1170
  314.3546
  311.4596
  320.8685
  315.0784
  304.9457
  302.0507
  292.6417
  291.1942
  282.5090
  278.1665
  278.1665
  275.9952
  273.8239]; 
b =  [184.1978
  188.5404
  198.6731
  204.4632
  209.5296
  218.2147
  219.6622
  213.8721
  215.3197
  220.8058
  220.8058
  213.1484
  208.8058
  200.1206
  195.7780
  187.8166
  187.8166
  176.9602
  176.2364
  183.4741
  182.7503
  184.1978
  188.5404
  188.5404
  187.0929];
atom.selectedProject.geom.addPolygon([a-20 b+70 ...
   zeros(length(b), 1)]*eye(3)*1.3, 'Polygon2' );

%% destroy Prague
atom.selectedProject.geom.boolean.subtract('Polygon1', 'Polygon2');
atom.selectedProject.geom.plot;

%%
atom.selectedProject.mesh.setGlobalMeshDensity(0.025);
densityFunction = '@(x, y) ones(size(x, 1),1)';
atom.selectedProject.mesh.setGlobalDensityFunction(densityFunction);
atom.selectedProject.mesh.getMesh;
atom.selectedProject.mesh.plotMesh;

%% end session
atom.exit;