clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);
geom = atom.selectedProject.geom;

%% create points of Polygon
temp1 = importdata('czech_rep.txt');
points = [temp1, zeros(size(temp1, 1), 1)];

%% add parametric Variable 

%% create Polygon
atom.selectedProject.geom.addPolygon(points);
fig = atom.selectedProject.geom.plot;

%% create Hole
pragueCenter = [370, 370, 0];
radius = 50;
atom.selectedProject.geom.addEllipse(pragueCenter, ...
   pragueCenter + [radius, 0, 0], pragueCenter + [0, radius, 0], 0, 2*pi);
fig = atom.selectedProject.geom.plot();

%% destroy Prague
atom.selectedProject.geom.boolean.subtract('Polygon1', 'Ellipse1');
fig = atom.selectedProject.geom.plot();

%% create points of Polygon2
points = [temp1 + 500, zeros(size(temp1, 1), 1)];
atom.selectedProject.geom.addPolygon(points);
fig = atom.selectedProject.geom.plot;

%% create Rectangle
borderPoint = [250, 500, 0];
width = 700;
height = 600;
atom.selectedProject.geom.addParallelogram(borderPoint, ...
   borderPoint + [width, 0, 0], borderPoint + [300, height, 0]);
fig = atom.selectedProject.geom.plot;

%% save Moravia
atom.selectedProject.geom.boolean.subtract('Polygon2', 'Parallelogram1');
fig = atom.selectedProject.geom.plot();

%% clear geom and atom
atom.exit;