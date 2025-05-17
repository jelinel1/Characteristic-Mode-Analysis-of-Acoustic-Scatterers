%% gaussQuad Example
% Shows how to use function gaussQuad

% INPUTS
% p ~ matrix [N x 3] ~ points coordinates
% t ~ matrix [N x 3] ~ triangles

% OUTPUT
% [N x N] ~ matrix of results

% Included in AToM. /info@antennatoolbox.com/
% (c) 2015, Vit Losenicky, CTU in Prague,  /vit.losenicky@antennatoolbox.com/
clc, clear;


%% Example 1
f = @(x1,y1,z1,x2,y2,z2) 1;
p = [0 1 1; 0 0 1; 0 0 0]';
t = [1 2 3];
example1 = models.utilities.gaussQuad.gaussQuad(f, p, t);

%% Data preparation for next examples
[p,t] = genMesh(0, 10, 10, 0, 10, 10);
p = p';
t = t';
p = [p zeros(length(p),1)];
% function f = 1/(r-r') -> r-r' is distance between 2 points
f = @(x1,y1,z1,x2,y2,z2) 1./((x1-x2).^2 + (y1-y2).^2 + (z1-z2).^2);

%% Example 2
% Using function gaussQuad, without any optional parameter
example2 = models.utilities.gaussQuad.gaussQuad(f, p, t);

%% Example 3
% Using function gaussQuad with function in m-file
% function in m-file one addition parameter
clear f;
par = 10;

f = @(x1,y1,z1,x2,y2,z2) ...
   gaussQuadFunc(x1,y1,z1,x2,y2,z2,par);
example3 = models.utilities.gaussQuad.gaussQuad(f, p, t);

%% Example 4
% Using function gaussQuad, with enabled debug level
f = @(x1,y1,z1,x2,y2,z2) 1./((x1-x2).^2 + (y1-y2).^2 + (z1-z2).^2);
example4 = models.utilities.gaussQuad.gaussQuad(f, p, t, 'Debug', true);

%% Example 5
% Using function gaussQuad, with modified start order
% (debug level enabled for comparison)
example5 = models.utilities.gaussQuad.gaussQuad(f, p, t, 'StartOrder', 5,...
   'Debug', true);

%% Example 6
% Using function gaussQuad, with modified maximal order
% (debug level enabled for comparison)
example6 = models.utilities.gaussQuad.gaussQuad(f, p, t, 'MaxOrder', 5,...
   'Debug', true);

%% Example 7
% Using function gaussQuad, with modified start and maximal order ->
% -> Integration computed with specific order
% (debug level enabled for comparison)
example7 = models.utilities.gaussQuad.gaussQuad(f, p, t, 'StartOrder', 7,...
   'MaxOrder', 7, 'Debug', true);

%% Example 8
% Using function gaussQuad, with modified maximal deviation (MaxDev in %)
% (debug level enabled for comparison)
example8 = models.utilities.gaussQuad.gaussQuad(f, p, t, 'MaxDev', 5,...
   'Debug', true);