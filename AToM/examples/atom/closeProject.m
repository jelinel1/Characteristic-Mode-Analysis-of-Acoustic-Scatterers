%% closeProject EXAMPLE: How to close project in AToM
% Opened projects in AToM are posible to close project by project using method
% closeProject('projectName') or close chosen projects using
% closeProject({'project1','project2'}) or close all projects using
% closeProject()
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
nameProject = cell(3);
for n = 1:3
   nameProject{n} = [nameDefault, num2str(n)]; 
   fullPath = fullfile(path, [nameProject{n}, ext]);
   if exist(fullPath,'file')
      delete(fullPath)
   end
   at.createProject(fullPath)
end

openedProjectsBefore = length(at.projects);
display(openedProjectsBefore)

%% 1.) closing project closeProject('projectName')
at.closeProject(nameProject{1})

openedProjectsAfter = length(at.projects);
display(openedProjectsAfter)
project1 = at.projects(1);
display(project1)
project2 = at.projects(2);
display(project2)
at.exit

%% 2.) closing project closeProject({'project1','project2'})
at.closeProject({nameProject{1},nameProject{2}})

openedProjectsAfter = length(at.projects);
display(openedProjectsAfter)
project1 = at.projects(1);
display(project1)
at.exit

%% 3.) closing project closeProject()
at.closeProject()

openedProjectsAfter = length(at.projects);
display(openedProjectsAfter)
at.exit