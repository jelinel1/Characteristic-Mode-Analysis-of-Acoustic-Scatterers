%% How does history work
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Vladimir Peric, CTU in Prague
% (c) 2015, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'at');

%% init AToM, create project
at = Atom.start(false);
at.createProject(fileName);

at.selectedProject.workspace.addVariable('a', 5);
at.selectedProject.workspace.addVariable('b', '2*a', 'some desc');
at.selectedProject.workspace.addVariable('c', 123, 'some desc');

%% Inspect historyNew
% Initialization of Atom and project creation is handled automatically
h = at.selectedProject.history;

%% Write down all the commands
hh = h.commandHistory;

for i=1:length(hh)
    % print to console
    fprintf(1, '%s\n', hh{i});
end

% Note that even though we used at here, the commands are saved using AToM
% We cannot find out the name programatically, so we use a reasonable
% default; practically, it makes no difference, since Atom is a singleton

%% Close Atom
at.quit