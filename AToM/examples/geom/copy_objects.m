clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

%% create Origin objects
atom.selectedProject.geom.addPoint([2, 1, 0])
atom.selectedProject.geom.addLine([1, 1, 0; 2, 3, 0]);
atom.selectedProject.geom.addLine([3, 0, 0; 0, 3, 0]);
atom.selectedProject.geom.addEllipseArc([1, 1, 0], [3, 1, 0], [1, 2, 0], 0, pi);
atom.selectedProject.geom.addEllipse([0, 0, 0], [2, 0, 0], [0, 1, 0], 0, pi/2);
atom.selectedProject.geom.addParallelogramFrame( ...
   [1, 1, 0], [3, 1, 0], [1, 2, 0]);
atom.selectedProject.geom.addParallelogram([-1, 1, 0], [1, 1, 0], [0, 2, 0]);
atom.selectedProject.geom.addEquationCurve('@(t) 1 + t.^2', ...
   '@(t) t', '@(t) 0*t', [0 2]);

atom.selectedProject.geom.plot;
% % (obj, objName, vect, nNew, newName, type)
%% copy Point specifying nothing
atom.selectedProject.geom.copyObject('Point1', [1, -1, 0], 3);
atom.selectedProject.geom.plot;

%% copy Line specifying newName
atom.selectedProject.geom.copyObject('Line1', [1 1 0], 2, 'Line1Copy');
geom = atom.selectedProject.geom;
names = {geom.line(2:end).name}
atom.selectedProject.geom.plot;

%% copy EllipseArc specifying type of Object
atom.selectedProject.geom.copyObject('EllipseArc1', [-1 -1 0], 2, 'name', ...
   'EllipseArc');
names = {geom.ellipsearc(2:end).name}
atom.selectedProject.geom.plot;

%% other objects
atom.selectedProject.geom.copyObject('Ellipse1', [2 1 0], 2);
atom.selectedProject.geom.copyObject('EquationCurve1', [1 -1 0], 2);
atom.selectedProject.geom.copyObject('ParallelogramFrame1', [-3 3 -3], 3);
atom.selectedProject.geom.copyObject('Parallelogram1', [2 2 0], 1);

atom.selectedProject.geom.plot;

%% copy PolyCurve
atom.selectedProject.geom.addPolyCurve('Line1, Line2, EllipseArc1');
atom.selectedProject.geom.copyObject('PolyCurve1', [4 4 0], 2);
atom.selectedProject.geom.plot;

%% add Line to copied PolyCurve
atom.selectedProject.geom.addLine([6, 9.5, 0; 12, 9.5, 0])
atom.selectedProject.geom.addCurveToPolyCurve('PolyCurve1Copy2', 'Line9');
atom.selectedProject.geom.plot;

%%
atom.exit;