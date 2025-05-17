%% mouseListener calls appropriate handle when mouse click caused some callback.
% This method of Viewer class call appropriate handle.
%
%  INPUTS
%   selectionTypes: cell with these chars:
%                  'normal' - no additional key was pressed during click
%                  'extend' - Shift or both keys pressed
%                  'alt' - Ctrl or right button pressed
%                  'open' - double any mouse button
%   myHandles: cell array of of cell array of function handles, cell [n x 1]
%
%  SYNTAX
%
%   geomListBox.ButtonDownFcn = {@obj.mouseListener, {'normal'}, ...
%                                              {{@obj.handleToCallAfterClick}}};
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
