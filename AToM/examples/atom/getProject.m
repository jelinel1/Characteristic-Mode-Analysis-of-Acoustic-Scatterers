%% getProject EXAMPLE: How to get project name or his order
% Using getProject(input) where is 'input' as double (project order), the 
% function returns project name. On the other side, for 'input' as string 
% (project name), the function returns project order.
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

%% 1.) get project with input as string
at.getProject(nameProject{1})

%% 2.) get project with input as double
at.getProject(2)
at.exit