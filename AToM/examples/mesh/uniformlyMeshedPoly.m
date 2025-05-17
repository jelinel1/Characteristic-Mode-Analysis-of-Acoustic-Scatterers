clc, clear all

%% polygon1
poly1 =[0.4 0.7 0;
   0 0.7 0;
   0.3 0.45 0;
   0.2 0.1 0;
   0.5 0.3 0;
   0.8 0.1 0;
   0.7 0.45 0;
   1 0.7 0;
   0.6 0.7 0;
   0.5 1 0];

hole1 = [0.4 0.4 0;
   0.6 0.4 0;
   0.6 0.6 0;
   0.4 0.6 0];

hole2 = [0.1 0.666 0;
   0.25 0.55 0;
   0.3 0.666 0];

hole3 = [0.7 0.666 0;
   0.75 0.55 0;
   0.9 0.666 0];

%% polygon2
poly2 = [0 0 0; 1 0 0; 1 1 0; 0 1 0];

%% polygon3
poly3 = [0 1 0.5; 1 1 1; 1 0 0.5; 0 0 0];

%% mesh polygon
[p, t] = models.utilities.meshPublic.uniformTriangulation3D(poly1, ...
   {hole1, hole2, hole3}, 0.005, 'equilateral');
% [p, t] = models.utilities.meshPublic.uniformTriangulation3D(poly1, ...
%    {hole2, hole3}, 0.01, 'right');
% [p, t] = models.utilities.meshPublic.uniformTriangulation3D(poly2, ...
%    {}, 0.1, 'equilateral');
triplot(t,p(:,1),p(:,2), 'k');

%% mesh 3D polygon
[points2, t] = models.utilities.meshPublic.uniformTriangulation3D(poly3, ...
   {}, 0.01, 'equilateral');
figure
trimesh(t,points2(:,1),points2(:,2),points2(:,3));
