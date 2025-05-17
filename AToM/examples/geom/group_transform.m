clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% create Objects
atom.selectedProject.geom.addPoint( [2, 1, 0]);
atom.selectedProject.geom.addLine( [1, 1, 0; -3, -1, 0]);
atom.selectedProject.geom.addEllipseArc([0, 3, 0], [0, 5, 0], ...
   [-1, 3, 0], 0, pi);
atom.selectedProject.geom.addEquationCurve(...
   '@(t) sin(t) + 1', '@(t) t - 2', '@(t) 0*t', [0 2*pi]);
atom.selectedProject.geom.addParallelogramFrame(...
   [2, 1, 0], [4, 2, 0], [3, 3, 0]);
% vizualization of current Geom
atom.selectedProject.geom.plot;

%% create groups
atom.selectedProject.geom.group.createGroup('Group1');
atom.selectedProject.geom.group.createGroup('Group2');

%% add GeomObjects to GroupObjects
atom.selectedProject.geom.group.addObjectToGroup('Group1', ...
   'Line1, ParallelogramFrame1');
atom.selectedProject.geom.group.addObjectToGroup('Group2', ...
   'EllipseArc1, EquationCurve1');
geom = atom.selectedProject.geom;
groupPoint = geom.point(1).group %#ok<*NOPTS>
groupLine = geom.line(1).group %#ok<*NASGU>
groupEllipseArc = geom.ellipsearc(1).group
groupEquationCurve = geom.equationcurve(1).group
groupParallelogramFrame = geom.parallelogramframe(1).group

%% rename GroupObject
atom.selectedProject.geom.group.renameGroupObject('Group1', 'epesniGrupa');

groupLine = geom.line(1).group
groupParallelogramFrame = geom.parallelogramframe(1).group

%% transform all objects in Group2, also zou can use methods rotateObject, ...
% rotateXObject, rotateYObject, rotateZObject, scaleObject, translateXObject, 
% setIs
atom.selectedProject.geom.group.rotateZObject('Group2', pi/2);
fig = atom.selectedProject.geom.plot();

%% remove GeomObject from existing Group
atom.selectedProject.geom.group.removeObjectFromGroup(...
   'epesniGrupa', 'Line1', 'Line');
groupLine = geom.line(1).group

%% set common properties to all GeomObjects from existing Group
% isMeshed, meshSize
% atom.selectedProject.geom.group.setIsMeshed('Group2', 0);
% stateEllipseArc = geom.ellipsearc(1).isMeshed
% stateEquationCurve = geom.equationcurve(1).isMeshed

%% remove GroupObject
atom.selectedProject.geom.group.removeGroup('Group2');
groupEllipseArc = geom.ellipsearc(1).group
groupEquationCurve = geom.equationcurve(1).group

%% group structure
atom.selectedProject.geom.group.createGroup('Group1');
atom.selectedProject.geom.group.createGroup('Group2');
atom.selectedProject.geom.group.createGroup('Group11');
atom.selectedProject.geom.group.createGroup('Group12');
atom.selectedProject.geom.group.createGroup('Group21');
atom.selectedProject.geom.group.createGroup('Group22');

% Groups 'Group11' and 'Group12' are subGroups of 'Group1'
atom.selectedProject.geom.group.makeGroupSubGroup( ...
   'Group11, Group12', 'Group1');
% Groups 'Group11' and 'Group12' are subGroups of 'Group1'
atom.selectedProject.geom.group.makeGroupSubGroup( ...
   'Group21, Group22', 'Group2');

groupTable = geom.group.groupTable

%% make change using superior Group
atom.selectedProject.geom.group.makeGroupSubGroup( ...
   'epesniGrupa', 'Group1');
atom.selectedProject.geom.group.rotateZObject('Group1', pi/2);
atom.selectedProject.geom.plot;


%%
atom.selectedProject.save();

atom.exit;