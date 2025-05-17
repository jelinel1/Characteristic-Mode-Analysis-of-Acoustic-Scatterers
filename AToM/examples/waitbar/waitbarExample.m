%% Waitbar example
clear, clc, close all
%% prepare figure
f = figure('units', 'pixels', 'position', [400 400 300 400]);

%% WAITBAR
% Constructor: obj = Waitbar(parentFig, newString, newValue, newPosition, ...
%            text2barRatio)
% text2barRatio = ratio between width of string field and width of colorbar

%% create first waitbar
wb1 = models.utilities.graphics.Waitbar(f, 'Waitbar 1', 0, [10 10 280 100], ...
   0);

%% create second waitbar
wb2 = models.utilities.graphics.Waitbar(f, 'Waitbar 2', 0.4, ...
   [10 120 250 25], 0.3);
wb2.colorMap(1,:) = [1 0 0]; %change colors: red -> yellow -> green
wb2.colorMap(2,:) = [1 1 0];
wb2.colorMap(3,:) = [0 1 0];

%% create third waitbar
wb3 = models.utilities.graphics.Waitbar(f, 'Last Waitbar with very long text', 1, ...
   [10 170 280 200], 0.3);

%% create empty waitbar
wbE = models.utilities.graphics.Waitbar;

%% loop with updates
N = 100;
for n = 1:100
   x = n/N;
   
   % wb1 
   wb1.update(x);
   
   % wb2
   if x > 0.4
      wb2.update(x);
   end
   
   % wb3
   if mod(n, 2)
      wb3.update(1-x);
   end
   drawnow;
   pause(0.2);
end
   
   
   
   