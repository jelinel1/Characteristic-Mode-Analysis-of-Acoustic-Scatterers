%% keyListener calls appropriate handle when specified keys are pressed.
% This method of Viewer class can distinguis what keys were pressed on opened
% figure. Then determine if these keys are some of the allowed combination and
% call appropriate handle.
%
%  INPUTS
%   obj: instance of viewer where callback function of GUI was defined
%   myModifier: cell array of strings with names of modifier key, cell [n x 1]
%   myKey: cell array of strings with names of keys, cell [n x 1]
%   myHandle: cell array of cell array of function handles, cell [n x 1]
%
%  SYNTAX
%
%  window.KeyPressFcn = {@obj.keyListener, ...
%                                {''}, {'delete'}, {{@(a, b)obj.methodToCall}}};
%
% Set to figure window KeyPressFcn as @(a, b)obj.methodToCall and call it when
% delete was pushed.
%
%  window.KeyPressFcn = {@obj.keyListener, {''; 'control'}, {'delete'; 'a'}, ...
%                      {{@(a, b)obj.methodToCall}, {@(a, b)obj.methodToCall2}}};
%
% Moreover call @(a, b)obj.methodToCall2 when Ctrl+a is pushed.
%
%  window.KeyPressFcn = {@obj.keyListener, {''; 'control'}, {'delete'; 'a'}, ...
%                 {{@(a, b)obj.methodToCall, @obj.nextHandle}, ...
%                                                  {@(a, b)obj.methodToCall2}}};
%
% When delete is pushed call sequentially obj.methodToCall and obj.nextHandle.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
