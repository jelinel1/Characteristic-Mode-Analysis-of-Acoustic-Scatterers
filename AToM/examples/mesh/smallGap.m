clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(true);
atom.createProject(fileName);

%%
atom.selectedProject.mesh.setProperties('meshOnFly', 1);
atom.selectedProject.workspace.addVariable('n', 5);
atom.selectedProject.geom.addEllipse('[0 0 0]', '[1 0 0]', ...
   '[0 1/2 0]', '0', '2*pi', 'Ellipse1');
atom.selectedProject.geom.addParallelogram('[-0.75 0 0]', ...
   '[0.75 0 0]', '[-0.75 1/n 0]', 'Parallelogram1');
atom.selectedProject.geom.boolean.subtract('Ellipse1', 'Parallelogram1');
atom.selectedProject.mesh.setGlobalMeshDensity(2);
atom.selectedProject.mesh.getMesh;

for n = 10:10:100
   atom.selectedProject.workspace.editExpression('n', n);
   atom.selectedProject.mesh.plotMesh;
   pause(1);
end

%% end session
atom.exit;