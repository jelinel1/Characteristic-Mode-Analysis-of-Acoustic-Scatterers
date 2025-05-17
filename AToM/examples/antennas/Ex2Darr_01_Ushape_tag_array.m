%% Create an array of u-shape tags
clc; close all;   

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

%% create variables
tic
tagHeight = 1;
inputVect = [0, 0.2, 0, 0.3, 0.22, ...  % s1, x position margin (2nd, 3rd ...Nth)
   0, 0.2, 0.4, 0.3, 0.5, ...  % s2, y spacings (2nd, 3rd ...Nth)
   3, 2, 1.5, 3, 2.5, ...  % w1, total tag width
   0.3, 0.1, 0.25, 0.4, 0.25, ...  % w2, microstrip width - baseline
   0.2, 0.3, 0.2, 0.2, 0.1];  % w3, microstrip width - branches

% prepare varLists, add zero to spacings of first (bottom) tag
nTags = size(inputVect, 2)/5;
s1 = inputVect(1:nTags);
s2 = inputVect(nTags+1:2*nTags);
w1 = inputVect(2*nTags+1:3*nTags);
w2 = inputVect(3*nTags+1:4*nTags);
w3 = inputVect(4*nTags+1:5*nTags);

for iTag = 1:nTags
   temp1 = cumsum(s2(1:iTag));
   yShift = temp1(end) + (iTag-1)*tagHeight;
   points = [s1(iTag), yShift, 0; ...  % leftDownPoint
      s1(iTag) + w1(iTag), yShift, 0; ...  % rightDownPoint
      s1(iTag) + w1(iTag), yShift + w3(iTag), 0; ...
      s1(iTag) + w2(iTag), yShift + w3(iTag), 0; ...
      s1(iTag) + w2(iTag), yShift + tagHeight - w3(iTag), 0; ...
      s1(iTag) + w1(iTag), yShift + tagHeight - w3(iTag), 0; ...
      s1(iTag) + w1(iTag), yShift + tagHeight, 0; ...  % rightUpPoint
      s1(iTag), yShift + tagHeight, 0; ...  % leftUpPoint
      s1(iTag), yShift, 0];  % leftDownPoint
   name = ['tag', num2str(iTag)];
   atom.selectedProject.geom.addPolygon(points, name);
end

fig = atom.selectedProject.geom.plot;

atom.selectedProject.physics.setFrequencyList('1e8')
atom.selectedProject.mesh.setGlobalMeshDensity(15);
atom.selectedProject.mesh.getMesh;
atom.selectedProject.mesh.plotMesh;
toc
%% save project
atom.selectedProject.save;

%% end session
atom.quit