%% wheelListener calls appropriate handle when wheel is spinning.
% It manage WindowScrollWheelFcn callbacks.
%
%  INPUTS
%   myHandle: cell array of of cell array of function handles, cell [n x 1]
%
%  SYNTAX
%
%   figure.WindowScrollWheelFcn = {@designViewer.mouseListener, ...
%      {{@(a, b)designViewer.zoom(1), @(a, b)disp('+')}, ...
%      {@(a, b)designViewer.zoom(-1), @(a, b)disp('-')}}...
%      };
%
% When mouseListener is connected with WindowScrollWheelFcn callback, then
% myHandle has to be cell [1 x 2], where myHandle{1} are handles called when
% direction od wheel movement is positive, myHandle{2} are called when direction
% is negative.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
