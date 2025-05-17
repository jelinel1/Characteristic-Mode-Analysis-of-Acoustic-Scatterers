%% newProject EXAMPLE: How to create new project in AToM
% New project is created by method createProject. This method require one input
% parameter (project name). There are four options how to write the project
% name.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Filip Kozak, CTU in Prague
% (c) 2018, Miloslav Capek, CTU in Prague, miloslav.capek@antennatoolbox.com

clear;
close all;
clc

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'at');
[folder, onlyName, ext] = fileparts(fileName);

% start AToM, create project
%% 1.) only project name (for example 'dipole')
% In this case, project will be created to the folder where script was executed.
% If some other folder than '' is set in atomPrefereences.m 
% ('general.projectPath'), the project is saved to that foledr.
at = Atom.start(false);
at.createProject(onlyName);

fullFileName = at.selectedProject.fullPath;
at.quit
delete(fullFileName);

%% 2.) file name (for example 'dipole.atom')
% In this case, project will be created same way as in the first option. AToM
% support only .atom extension.
at = Atom.start(false);

nameWithExt = [onlyName, ext];
at.createProject(nameWithExt)

fullFileName = at.selectedProject.fullPath;
at.quit
delete(fullFileName);

%% 3.) full file name
% This is option how to create project file to user's choosen path.
newName = [onlyName, 'UsingFullPath', ext];
fullPath = fullfile(folder, newName);
display(fullPath)
at = Atom.start(false);
at.createProject(fullPath);
at.quit
delete(fullPath);

%% 4.) through GUI
% Full project location can be select through GUI
at = Atom.start(false);
at.createProject();

fullFileName = at.selectedProject.fullPath;
at.quit
delete(fullFileName);

%% Properties
% 1.) Last created project is set like a selected project in the property
% selectedProject in the Atom instance.
at = Atom.start(false);
at.createProject('example')
exampleName = at.selectedProject.fullPath;
at.selectedProject.name
at.createProject('example1')
example1Name = at.selectedProject.fullPath;
at.selectedProject.name

% 2.) It is not allowed to create project with same name.

try
   at.createProject('example1')
catch err
   disp(err.message);
end
at.quit
delete(exampleName, example1Name);