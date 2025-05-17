function [p,t] = genMesh(Xmin, Xmax, numberX, Ymin, Ymax, numberY)
% SYNTAX:
%       [p,t] = genMesh(Xmin, Xmax, numberX, Ymin, Ymax, numberY);
% INPUT:
%       Xmin, Xmax ~ Interval of X-axis
%       Ymin, Ymax ~ Interval of Y-axis
%       numberX, numberY ~ number of points between min and max on axis

%OUTPUTS:
%          p ~ p - matrix
%          t ~ t - matrix
%
% Included in AToM. /info@antennatoolbox.com/
% (c) 2015, Ondrej Kratky, CTU in Prague, /ondrej.kratky@antennatoolbox.com/
% (c) 2015, Vit Losenicky, CTU in Prague,  /vit.losenicky@antennatoolbox.com/


%% Preparation
x = linspace(Xmin, Xmax, numberX);
y = linspace(Ymin, Ymax, numberY);

%% p matrix
p = NaN(2,length(x)*length(y));
p(2,:) = repmat(y,1,length(x));
a = 1;
b = length(y);
for k = 1:length(x)
   p(1,a:b) = repmat(x(k),1,length(y));
   a = b + 1;
   b = b + length(y);
end

%% t matrix
t = NaN(3, 2*(length(x)-1)*(length(y)-1));
vektor1 = 1:length(x)*length(y) - length(y);
vektor1(1:length(y):end) = [];
vektor2 = length(y) + 2 : length(x)*length(y);
vektor2(length(y):length(y):end - 1) = [];
t(2,2:2:end) = vektor1;
t(3,1:2:end-1) = vektor2;
t(3,2:2:end) = vektor2;
t(1,1:2:end-1) = vektor1 - 1;
t(1,2:2:end) = vektor1 - 1;
t(2,1:2:end-1) = vektor2 - 1;