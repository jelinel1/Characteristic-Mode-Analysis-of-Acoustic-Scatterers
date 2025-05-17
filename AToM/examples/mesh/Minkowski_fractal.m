clc;
close all;
clear all; %#ok<*CLSCR>

%%
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.initialize(true);
atom.createProject(fileName);

%%
pts  = [-50 -30;50 -30;50 30;-50 30];
trns = [1/5 0 0 1/3 0 0; ...
   0.45 0 0 0.45 27.5 17.5; ...
   0.45 0 0 0.45 27.5 -17.5; ...
   0.45 0 0 0.45 -27.5 17.5; ...
   0.45 0 0 0.45 -27.5 -17.5];

IFS =   models.utilities.geomPublic.gen_ifs_fractal(pts,trns, 2);

%%
for thisPoly = 1:length(IFS)
   p1 = [IFS(1,:,thisPoly) 0];
   p2 = [IFS(2,:,thisPoly) 0];
   p3 = [IFS(4,:,thisPoly) 0];
   atom.selectedProject.geom.addParallelogram(p1, p2, p3);
      if thisPoly > 1
         atom.selectedProject.geom.boolean.unite('Parallelogram1', ...
            ['Parallelogram' num2str(thisPoly)]);
      end
end

%%
atom.selectedProject.mesh.setGlobalMeshDensity(0.055);
atom.selectedProject.mesh.getMesh;
atom.selectedProject.mesh.plotMesh;
atom.selectedProject.geom.plot

%% end session
atom.exit;