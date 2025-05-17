clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create variables
atom.selectedProject.workspace.addVariable('c1', [0 0 0], 'center1')
atom.selectedProject.workspace.addVariable('r', 1, 'radius')
atom.selectedProject.workspace.addVariable('w', 'r/20', 'width')
atom.selectedProject.workspace.addVariable('u', 'r/5', 'width')

%% create Objects
atom.selectedProject.geom.addEllipse('c1', 'c1 + [r, 0, 0]', ...
   'c1 + [0, r, 0]', 0, 2*pi, 'OuterRing');
atom.selectedProject.geom.addEllipse('c1', 'c1 + [r-w, 0, 0]', ...
   'c1 + [0, r-w, 0]', 0, 2*pi, 'InnerRing');
atom.selectedProject.geom.addParallelogram('[-(u/2-w), -1.1*r, 0]', ...
   '[u/2-w, -1.1*r, 0]', '[-(u/2-w), 1.1*r, 0]', 'RectangleMinus');
atom.selectedProject.geom.addPolygon(['[-u/2, -u, 0; ', ...
   '-u/2, -sqrt((r-w)^2 - (u/2)^2), 0; -u/2+w, -sqrt(r^2 - (u/2-w)^2), 0; '...
   '-u/2+w, -u-w, 0; u/2-w, -u-w, 0; u/2-w, -sqrt(r^2 - (u/2-w)^2), 0; ', ...
   'u/2, -sqrt((r-w)^2 - (u/2)^2), 0; u/2, -u, 0]'], 'LowPartPlus');
atom.selectedProject.geom.addPolygon(['[-u/2, u, 0; u/2, u, 0;', ...
   'u/2, sqrt((r-w)^2 - (u/2)^2), 0; u/2-w, sqrt(r^2 - (u/2-w)^2), 0; ', ...
   'u/2-w, u+w, 0; -u/2+w, u+w, 0; -u/2+w, sqrt(r^2 - (u/2-w)^2), 0;', ...
   '-u/2, sqrt((r-w)^2 - (u/2)^2), 0]'], 'HighPartPlus');

%% cut objects
atom.selectedProject.geom.boolean.subtract('OuterRing', 'InnerRing');
atom.selectedProject.geom.boolean.subtract('OuterRing', 'RectangleMinus');

atom.selectedProject.geom.boolean.unite('OuterRing', 'LowPartPlus');
atom.selectedProject.geom.boolean.unite('OuterRing', 'HighPartPlus');

atom.selectedProject.mesh.setGlobalMeshDensity(2.3);

% Right part (x>0) of the mesh will have three time lower triangle density than
% left part (x<=0).
atom.selectedProject.mesh.setGlobalDensityFunction('@(x,y) (x>0).*1 + (x<=0).*1/3');
atom.selectedProject.mesh.getMesh();
atom.selectedProject.mesh.plotMesh();

%% end session
atom.quit