clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

%% create objects
atom.selectedProject.geom.addEllipse( ...
   '[0 0 0]', '[3 0 0]', '[0 2 0]', 0, 2*pi, 'Par1');
atom.selectedProject.geom.addParallelogram( ...
   '[-1/2 -1/2 0]', '[1/2 -1/2 0]', '[-1/2 1/2 0]', 'Par2');

%% Boolean operation
atom.selectedProject.geom.boolean.subtract('Par1', 'Par2');

%% get segmentation of x+, y+ part
eliObject = geom.ellipse(1);
seg1 = eliObject.getSymmetrySegmentation({'zy', 'xz'});

%% get segmentation of z+
[seg2, onSymm] = geom.ellipse(1).getSymmetrySegmentation({'xy'});

%% vizualize
nSym = size(seg1.segments, 2);
figure();
title('X+, Y+ segmentation')
hold on
for iSym = 1:nSym
   [poly{iSym}, ~] = ...
      models.geom.Boolean.createPolygon(eliObject.curve, ...
      seg1.segments{iSym}, ...
      seg1.segmentParams{iSym}, ...
      seg1.segType{iSym}, ...
      seg1.isHoleSegment{iSym});
   
   plot3(poly{iSym}(:,1), poly{iSym}(:,2), poly{iSym}(:,3), 'r-x')
end

nSym = size(seg1.segments, 2);
figure();
title('Z+ segmentation')
hold on
for iSym = 1:nSym
   [poly{iSym}, ~] = ...
      models.geom.Boolean.createPolygon(eliObject.curve, ...
      seg2.segments{iSym}, ...
      seg2.segmentParams{iSym}, ...
      seg2.segType{iSym}, ...
      seg2.isHoleSegment{iSym});
   
   plot3(poly{iSym}(:,1), poly{iSym}(:,2), poly{iSym}(:,3), 'r-x')
end

atom.exit;