clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% The following parameters will be used in FOPS:
rout = 1;
rin = 0.6;
d = 0.5;
h = 1;

%% create variables
atom.selectedProject.workspace.addVariable('rout', rout, 'outer radius');
atom.selectedProject.workspace.addVariable('rin', rin, 'inner radius');
atom.selectedProject.workspace.addVariable('d', d, 'distance')
atom.selectedProject.workspace.addVariable('h', h, 'height')
atom.selectedProject.workspace.addVariable('cB', '[0 0 -h/2]', 'center1')
atom.selectedProject.workspace.addVariable('cT', '[0 0 h/2]', 'center2')
atom.selectedProject.workspace.addVariable('Lout', 'sqrt(rout^2 - (d/2)^2)', ...
   'pivot1')
atom.selectedProject.workspace.addVariable('Lin', 'sqrt(rin^2 - (d/2)^2)', ...
   'pivot2')

%% Basic structures - bottom structure
atom.selectedProject.geom.addEllipse('cB', 'cB + [rout, 0, 0]', ...
   'cB + [0, rout, 0]', 0, 2*pi, 'OuterRingB');
atom.selectedProject.geom.addEllipse('cB', 'cB + [rin, 0, 0]', ...
   'cB + [0, rin, 0]', 0, 2*pi, 'InnerRingB');
atom.selectedProject.geom.addParallelogram('[-2*rout, -d/2, -h/2]', ...
   '[2*rout, -d/2, -h/2]', '[-2*rout, d/2, -h/2]', 'RectangleMinusB');

%% Finalize bottom plane
atom.selectedProject.geom.boolean.subtract('OuterRingB', 'InnerRingB');
atom.selectedProject.geom.boolean.subtract('OuterRingB', 'RectangleMinusB');

%% Basic structures - top structure
atom.selectedProject.geom.addEllipse('cT', 'cT + [rout, 0, 0]', ...
   'cT + [0, rout, 0]', 0, 2*pi, 'OuterRingT');
atom.selectedProject.geom.addEllipse('cT', 'cT + [rin, 0, 0]', ...
   'cT + [0, rin, 0]', 0, 2*pi, 'InnerRingT');
atom.selectedProject.geom.addParallelogram('[-2*rout, -d/2, h/2]', ...
   '[2*rout, -d/2, h/2]', '[-2*rout, d/2, h/2]', 'RectangleMinusT');

%% Finalize top plane
atom.selectedProject.geom.boolean.subtract('OuterRingT', 'InnerRingT');
atom.selectedProject.geom.boolean.subtract('OuterRingT', 'RectangleMinusT');

%% Create the rectangular connections:
atom.selectedProject.geom.addParallelogram('[-Lout, -d/2, -h/2]', ...
   '[-Lout, d/2, h/2]', '[-Lin, -d/2, -h/2]', 'RectangleLeft');
atom.selectedProject.geom.addParallelogram('[Lin, d/2, -h/2]', ...
   '[Lout, d/2, -h/2]', '[Lin, -d/2, h/2]', 'RectangleRight');

%% geometry boolean
atom.selectedProject.geom.boolean.unite('OuterRingT', 'RectangleLeft');
atom.selectedProject.geom.boolean.unite('OuterRingT', 'RectangleRight');
atom.selectedProject.geom.boolean.unite('OuterRingT', 'OuterRingB');

%% create Mesh
atom.selectedProject.mesh.setGlobalMeshDensity(2.3);
atom.selectedProject.mesh.getMesh;
atom.selectedProject.mesh.plotMesh;

%% end session
atom.quit