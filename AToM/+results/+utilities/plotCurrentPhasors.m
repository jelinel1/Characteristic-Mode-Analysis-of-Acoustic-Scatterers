%% plotCurrentPhasors creates animated plot of current phasors
% Creates simulation showing change of current over time according to
% equation Re{A * exp(1i * theta)}.
%
%  INPUTS
%   mesh:      mesh struct created by AToM, struct [1 x 1]
%   basisFcns: basis functions struct created by AToM, struct [1 x 1]
%   iVec:      vector of expansion coeficients from AToM MoM,
%               double [N x 1]
%
%  INPUTS
%  (optional)
%   startAngle  simulation start angle, double [1 x 1], default value 0
%   endAngle    simulation end anfle, double [1 x 1], default value 4pi
%   steps       number of angle steps, double [1 x 1], default value 11
%   pauseTime   pause time between steps, double [1 x 1], default value 0.1
%   climits     sets colormap limits, double [1 x 2], default value [0 100]
%
%  SYNTAX
%  plotCurrentPhasors(mesh, basisFcns, iVec)
%  plotCurrentPhasors(mesh, basisFcns, iVec, 'steps', 25, 'endAngle', ...
%  6*pi);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2018, Vit Losenicky, CTU in Prague, vit.losenicky@antennatoolbox.com
% mcode
