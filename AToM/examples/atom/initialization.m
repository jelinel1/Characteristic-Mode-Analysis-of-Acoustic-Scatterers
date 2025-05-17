%% initialization EXAMPLE: How to start AToM
% This example shows four options how to start AToM
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
clear;close all;clc

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'at1');
[path, nameDefault, ext] = fileparts(fileName); 

%% init AToM
at1 = Atom.start(false);

%% Preparing project files
nameProject = cell(3);
for n = 1:3
   nameProject{n} = [nameDefault, num2str(n)]; 
   fullPath = fullfile(path, [nameProject{n}, ext]);
   if exist(fullPath,'file')
      delete(fullPath)
   end
   at1.createProject(fullPath)
end

%% Initialization of AToM by: 
% 
% atomReference = Atom.init(checkGUIopening)
% 
% 1. without GUI
% 
% The first option how to launch AToM is without Graphic User Interface (GUI).
% In this case is called method 'init' with parameter ('checkGUIopening')
% logical false. Second parameter of this method ('preferedFile') is set as
% default value (string with path to \+internal\atomPreferences.m).
% at1 = Atom.start(false);

% After that, AToM is inicializated without GUI and his preferences are in
% property 'preferences'. It can be seen, that default author name is 'AToM
% author'.
disp('at1.preferences.general.author:')
display(at1.preferences.general.author)

% Closing AToM.
at1.quit

%% Initialization of AToM by: 
% 
% atomReference = Atom.init(checkGUIopening)
% 
% 2. witht GUI
% 
% The second option how to launch AToM is with GUI. In this case is needed to
% call method 'init' with parameter ('checkGUIopening') logical 'true'. The
% second parameter is set as default value, same as in the first case
at2 = Atom.start(true);

% AToM is inicializated with GUI and his preferences are set as in the first
% case.
disp('at2.preferences.general.author:')
display(at2.preferences.general.author)

% Closing AToM.
at2.quit

%% Initialization of AToM by: 
% 
% atomReference = Atom.init(checkGUIopening, preferedFile)
% 
% 3. with preferred preferences m-file
% 
% The third option how to launch AToM is with two parameters. In this case is
% possible to set prefered full file name to preferences m-file. 

% full file name to another preferences file. 
validPath2preferencesFile = fullfile(pwd, 'atomPreferences.m');
atomFolder = models.utilities.getAToMFolder;
initPrefFile = fullfile(atomFolder, '+internal', 'atomPreferences.m');

copyfile(initPrefFile, validPath2preferencesFile);

% Initialization of AToM with two parameters
at3 = Atom.start(false, validPath2preferencesFile);

% Author in this m-file is set as 'unitTest author'
disp('at3.preferences.general.author:')
display(at3.preferences.general.author)

% Closing AToM.
at3.quit

% delete temporary preference file
delete(validPath2preferencesFile);

%% Initialization of AToM by: 
% 
% atomReference = Atom.init
% 
% 4. expected default initialization of AToM
% 
% It is possible to call method 'init' without any parameters. In this case will
% be AToM opened with GUI and with default preferences
at4 = Atom.start;

% Again with default preference values
disp('at4.preferences.general.author:')
display(at4.preferences.general.author)

% Closing AToM.
at4.quit

%% Properties of AToM
% 
% 1. Singleton
% 
% Method 'init' ensures that Atom class is Singleton. It is possible to create
% more referencies into Atom object, but these referencies are on the same
% object.

% first reference
at1 = Atom.start(false);

% second reference with another preferences
% full file name to another preferences file. 
validPath2preferencesFile = fullfile(pwd, 'atomPreferences.m');
atomFolder = models.utilities.getAToMFolder;
initPrefFile = fullfile(atomFolder, '+internal', 'atomPreferences.m');

copyfile(initPrefFile, validPath2preferencesFile);

at2 = Atom.start(false, validPath2preferencesFile);

% Proof that AToM is singleton will be created project into 'at2' reference
at2.createProject('example');

% The same project as in 'at2' is in 'at1'
disp('at1.selectedProject.name:')
display(at1.selectedProject.name)
disp('at2.selectedProject.name:')
display(at2.selectedProject.name)

% 2. Preferences file is read only once (in first initialization)
% 
% Although the second initialization of AToM was with prefered preferences file,
% expacted preference (general.author = 'unitTest author') is not token. The 
% preferences values are token from first initialization (general.author = 'AToM
% author').
disp('at1.preferences.general.author:')
display(at1.preferences.general.author)
disp('at2.preferences.general.author:')
display(at2.preferences.general.author)

% It can be see, that every references are deleted by closing one of them
exampleName = at2.selectedProject.fullPath;
at1.quit

% at2.quit  % HAS NO SENSE, AToM is singleton

% delete temporary preference file and example.atom
delete(exampleName);
delete(validPath2preferencesFile);

