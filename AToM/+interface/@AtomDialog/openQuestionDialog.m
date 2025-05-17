%% openQuestionDialog creates simple gui with buttons and text.
% This method creates whole AtomDialog gui with text and pushbuttons.
%
%  INPUTS
%   textInFigure: text shown in figure. Every variable cell is new row in text,
%                 cell [1 x n]
%   stringsOnButtons: strings on buttons, cell [1 x n]
%   handlesToButtons: handles to all push buttons. In cell for one pushbutton
%                     can be more handles, but everyone has to be in separate
%                     cell. In cell with single handle can be handle and list of
%                     its inputs. cell [1 x n]
%   defaultButtonString: button which is active by default, char [1 x n]
%   varargin: name-values pairs of uicontrol object with text
%
%  SYNTAX
%
%  atomDialog.openQuestionDialog({'Two line', 'text'}, ...
%            {'OK', 'Cancel', 'Nothing'}, ...
%           {{{@handleToOK, input}, {@handleToOK2}}, {@closeHandle}, {}}, ...
%           'BackgroundColor', 'r', 'FontWeight', 'bold');
%
%   e.g. handleToOK = @geom.deleteObject; input = 'Point1';
%   If we need more dots '.' in handle, anonymous function has to be used:
%   handleToOK = @(type, coor)at.followedProject.geom.addObject(type, coor);
%   type = 'Point'; coor = [1 2 3];
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
