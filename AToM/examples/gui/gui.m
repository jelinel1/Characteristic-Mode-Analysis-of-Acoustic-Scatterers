%% gui is script which shows usage of public methods of AToM gui.
% It is necessary to run script with F5 and use breakpoint for pause of executon
% and then use steps F10, Ctrl+Enter, etc.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2017, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
% mcode

clear

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% GUI methods
% it is possible to open all viewers at once by gui.open method
atom.gui.open;

%% Change color template of gui
% appropriate file with color template has to be placed in
% AToM/+interface/+templates folder
atom.gui.applyTemplate('darkTemplate');

%% Change error treatment
% it is possible to change if error will be rethrown into command line, or just
% error dialog will be shown.
atom.gui.setProperties('throwErrorToCommandWindow', true);

%% Closing all viewers
% it is possible to close all viewers at once
atom.gui.close;

%% Opening and closing individual viewers
% it is possible to close and open individual viewers

atom.gui.mainViewer.open;
atom.gui.workspaceViewer.open;
atom.gui.historyViewer.open;
atom.gui.designViewer.open;

atom.gui.designViewer.close;

%% Set precise size and position of viewers
% works with all viewers

atom.gui.workspaceViewer.setPosition([400 200 500 500]);
%% Set column width of workspace viewer
% accept row vector double [1 x 7]
% get old column witdhs
oldValues = atom.gui.workspaceViewer.columnWidth;
% set new values
atom.gui.workspaceViewer.setProperties('columnWidth', oldValues+20);
% column widths are also setted by resizing of figure

%% Order of rows in history viewer
% possible input is true or false
atom.gui.historyViewer.setProperties('forwardDirectionOfRows', true);

%% Quit AToM
atom.quit;