%% gausgaussQuadRWG Example
%$ Shows how to use function gaussQuadRWG

% INPUTS
% p ~ matrix [N x 3] ~ points coordinates
% t ~ matrix [N x 3] ~ triangles
% i ~ matrix [N x 4]:
% [:,1] ~ first triangle
% [:,2] ~ second triangle
% [:,3] ~ first point
% [:,4] ~ second point

% OUTPUT
% [N x 1] ~ vector of results, each row corresponds given row of i on the same
% row

% Included in AToM. /info@antennatoolbox.com/
% (c) 2015, Vit Losenicky, CTU in Prague,  /vit.losenicky@antennatoolbox.com/
clc, clear;

%% Example 1
f = @(x1,y1,z1,x2,y2,z2,o1x,o1y,o1z,o2x,o2y,o2z) 1;
p = [0 1 1; 0 0 1; 0 0 0]';
t = [1 2 3];

i = zeros(size(t,1)^2,4);
point = 1;
for a = 1:size(t,1)
   for b = 1:size(t,1)
      i(point,1) = a;
      i(point,2) = b;
      i(point,3) = round(size(p,2)*rand + 0.5);
      i(point,4) = round(size(p,2)*rand + 0.5);
      point = point + 1;
   end
end

example1 = models.utilities.gaussQuad.gaussQuadRWG(f, p, t, i);

%% Data preparation for next examples
[p,t] = genMesh(0, 10, 5, 0, 10, 5);
p = p';
t = t';
p = [p zeros(length(p),1)];

i = zeros(size(t,1)^2,4);
point = 1;
for a = 1:size(t,1)
   for b = 1:size(t,1)
      i(point,1) = a;
      i(point,2) = b;
      i(point,3) = round(size(p,2)*rand + 0.5);
      i(point,4) = round(size(p,2)*rand + 0.5);
      point = point + 1;
   end
end
clear a b;

% function f = 1/(r-r') -> r-r' is distance between 2 points
f = @(x1,y1,z1,x2,y2,z2,o1x,o1y,o1z,o2x,o2y,o2z) ...
   x1 + y1 + z1 + x2 + y2 + z2 + o1x + o1y + o1z + o2x + o2y + o2z;

%% Example 2
% Using function gaussQuadRWG, without any optional parameter
example2 = models.utilities.gaussQuad.gaussQuadRWG(f, p, t, i);

%% Example 3
% Using function gaussQuadRWG with function in m-file
% function in m-file one addition parameter
clear f;
par = 10;

f = @(x1,y1,z1,x2,y2,z2,o1x,o1y,o1z,o2x,o2y,o2z) ...
   gaussQuadRWGFunc(x1,y1,z1,x2,y2,z2,...
   o1x,o1y,o1z,o2x,o2y,o2z,par);
example3 = models.utilities.gaussQuad.gaussQuadRWG(f, p, t, i);

%% Example 4
% Using function gaussQuadRWG, with enabled debug level
f = @(x1,y1,z1,x2,y2,z2,o1x,o1y,o1z,o2x,o2y,o2z) ...
   sin(x1 + y1 + cos(z1 + x2 + y2 + z2 + o1x + o1y + o1z + o2x) + o2y + o2z);
example4 = models.utilities.gaussQuad.gaussQuadRWG(f, p, t, i, 'Debug', true);

%% Example 5
% Using function gaussQuadRWG, with modified start order
% (debug level enabled for comparison)
example5 = models.utilities.gaussQuad.gaussQuadRWG(f, p, t, i, 'StartOrder', 5,...
   'Debug', true);

%% Example 6
% Using function gaussQuadRWG, with modified maximal order
% (debug level enabled for comparison)
example6 = models.utilities.gaussQuad.gaussQuadRWG(f, p, t, i, 'MaxOrder', 5,...
   'Debug', true);

%% Example 7
% Using function gaussQuadRWG, with modified start and maximal order ->
% -> Integration computed with specific order
% (debug level enabled for comparison)
example7 = models.utilities.gaussQuad.gaussQuadRWG(f, p, t, i, 'StartOrder', 7,...
   'MaxOrder', 7, 'Debug', true);

%% Example 8
% Using function gaussQuadRWG, with modified maximal deviation (MaxDev in %)
% (debug level enabled for comparison)
example8 = models.utilities.gaussQuad.gaussQuadRWG(f, p, t, i, 'MaxDev', 5,...
   'Debug', true);