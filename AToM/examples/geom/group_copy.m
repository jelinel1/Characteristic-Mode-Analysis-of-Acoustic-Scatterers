clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

%% create Objects
atom.selectedProject.geom.addLine([0, 0, 0; 2, 0, 0]);
atom.selectedProject.geom.addLine([0, 3.5, 0; 2, 3.5, 0]);
atom.selectedProject.geom.addLine([0.5, -2, 0; 0.5, 2, 0]);
atom.selectedProject.geom.addLine([1.5, -2, 0; 1.5, 1.5, 0]);
% vizualization of current Geom
atom.selectedProject.geom.plot;

%% create groups
atom.selectedProject.geom.group.createGroup('Group1');
atom.selectedProject.geom.group.createGroup('Group11', 'Group1');
atom.selectedProject.geom.group.createGroup('Group111', 'Group11');

%% put objects to Groups
atom.selectedProject.geom.group.addObjectToGroup('Group11', 'Line1, Line2');
atom.selectedProject.geom.group.addObjectToGroup('Group111', 'Line3, Line4');

%% copy Group and its objects (translated with vector [2 2 0]) with default 
% name and default-times (once). If the Group was a subGroup, also the copied 
% Groups are subGroups of the same Group. 
atom.selectedProject.geom.group.copyObject('Group11', [2 2 0]);
geom.group.groupTable
atom.selectedProject.geom.plot;

%% copy Group and its objects (translated with vector [-2 -2 0]) with specified
% name and n-times (n = 2).
atom.selectedProject.geom.group.copyObject('Group11', [-2 -2 0], 2, 'myName');
geom.group.groupTable
atom.selectedProject.geom.plot;

%%
atom.selectedProject.save();
atom.exit;