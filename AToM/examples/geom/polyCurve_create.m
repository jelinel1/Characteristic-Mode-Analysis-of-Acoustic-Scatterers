clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;
% % % % % % % % % % % % % % % % % % % % % % % %
%         EllipseArc and three lines          %
% % % % % % % % % % % % % % % % % % % % % % % %
%% create objects
atom.selectedProject.geom.addEllipseArc( ...
   [0, 1, 1], [0, 3, 1], [0 1 2], 0, pi);
atom.selectedProject.geom.addLine( [0, -2, 1.5; 0, 4, 1.5]);  
atom.selectedProject.geom.addLine( [0, 1, -1; 0, 1, 3]);  
atom.selectedProject.geom.addLine( [0, 1, 0; 0, 4, 1.5]);
% atom.selectedProject.geom.addParallelogramFrame(...
%    [0 -2 -2.2], [0 2 0.5], [0 -2 0.5])
%% vizualization of current Geom
fig = atom.selectedProject.geom.plot;

%% create PolyCurve
atom.selectedProject.geom.addPolyCurve( ...
   'Line1, Line2, Line3, EllipseArc1');
% atom.selectedProject.geom.addPolyCurve( ...
%    'Line1, Line2, Line3, ParallelogramFrame1');
% atom.selectedProject.geom.addPolyCurve( ...
%    'Line1, Line2, Line3, ParallelogramFrame1, EllipseArc1');
% atom.selectedProject.geom.addPolyCurve( ...
%    'ParallelogramFrame1, EllipseArc1');

%% vizualize found cycles in PolyCurve 
fig = atom.selectedProject.geom.plot(fig.Number);

%% remove Curve #3
% atom.selectedProject.geom.polycurve(1).removeCurve(3);
% fig = atom.selectedProject.geom.plot(fig.Number);


% % % % % % % % % % % % % % % % % % % % % % % %
%       Six lines forming four squares        %
% % % % % % % % % % % % % % % % % % % % % % % %

%% create objects
atom.selectedProject.geom.addLine( [0, 0, 0; 2, 0, 0]);
atom.selectedProject.geom.addLine( [0, 1, 0; 2, 1, 0]);
atom.selectedProject.geom.addLine( [0, 2, 0; 2, 2, 0]);
atom.selectedProject.geom.addLine( [0, 0, 0; 0, 2, 0]);
atom.selectedProject.geom.addLine( [1, 0, 0; 1, 2, 0]);
atom.selectedProject.geom.addLine( [2, 0, 0; 2, 2, 0]);

%% vizualization of current Geom
fig = atom.selectedProject.geom.plot;

%% getting names of new lines
geom = atom.selectedProject.geom;
selectedLines = geom.line(4:9);
selectedLinesNames = strjoin({selectedLines.name}, ', ');

% selectedLines = 'Line4, Line2, Line3';


%% create PolyCurve
% geomObj = atom.selectedProject.geom;
atom.selectedProject.geom.addPolyCurve(...
   selectedLinesNames);
% 
% %% vizualize found cycles in PolyCurve 
fig = atom.selectedProject.geom.plot(fig.Number);

%%
atom.exit;