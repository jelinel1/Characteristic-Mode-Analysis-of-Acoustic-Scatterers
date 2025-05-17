%% selectProject EXAMPLE: How to select project to 'selectedProject' property
% There are two options for selecting of required project in 'selectProject'
% property in Atom class.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
clear;close all;clc

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'at');
[path, nameDefault, ext] = fileparts(fileName); 

%% init AToM
at = Atom.initialize(false);

%% Preparing project files
nameProject = cell(1, 3);
for n = 1:3
   nameProject{n} = [nameDefault, num2str(n)]; 
   fullPath = fullfile(path, [nameProject{n}, ext]);
   if exist(fullPath,'file')
      delete(fullPath)
   end
   at.createProject(fullPath)
end

selectedProjectsBefore = at.selectedProject.name;
display(selectedProjectsBefore)

%% 1.) select project using "project name"
at.selectProject(nameProject{1})  % project 1

selectedProjectsBefore = at.selectedProject.name;
display(selectedProjectsBefore)

%% 2.) select project using "project index"
at.selectProject(2)

selectedProjectsBefore = at.selectedProject.name;
display(selectedProjectsBefore)

%% Quit Atom
at.quit