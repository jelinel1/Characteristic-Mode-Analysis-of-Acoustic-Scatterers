function mySolver = myMoM2D(~)
%% Create inner solver for example GEP_withoutAToM_MoM2D.m

% Run AToM for mesh:
atom = Atom.start(false); 
delete('myEllipse.atom')
atom.createProject('myEllipse'); 
atom.selectedProject.geom.addEllipse('[0 0 0]', '[1 0 0]', '[0 1/2 0]', ...
   '0', '2*pi', 'Ellipse1');
atom.selectedProject.mesh.setElementSizeFromFrequency(false);
atom.selectedProject.mesh.setGlobalMeshDensity('0.1');
atom.selectedProject.mesh.getMesh(); 
mesh = atom.selectedProject.mesh.getMeshData2D();
atom.quit;

% prepare fields
mySolver.mesh = mesh;
mySolver.R = [];
mySolver.X = [];
end

