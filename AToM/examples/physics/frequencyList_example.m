%% frequencyList_example shows setting of frequency list of project.
% Structure is computed at frequency points defined in frequencyList.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
% mcode

clc; close all;

%% prepare session
fileName = mfilename('fullpath');
fileName = models.utilities.prepareExampleSession(fileName, 'atom');

%% init AToM, create project
atom = Atom.start(false);
atom.createProject(fileName);

%% default frequency point is 1e9 Hz
% ask for property frequencyList of physics gets expression of default 
% frequency list, i.e. output is char
defaultFreq = atom.selectedProject.physics.frequencyList

%% Set new frequency list
% Frequency points in list have to be vector with positive and finite numbers 
atom.selectedProject.physics.setFrequencyList(linspace(10e9, 20e9, 11));

freqList = atom.selectedProject.physics.frequencyList

% or equivalently set is as char expression
atom.selectedProject.physics.setFrequencyList('linspace(10e9, 20e9, 11)');

freqList = atom.selectedProject.physics.frequencyList
%% Using variables from workspace
% it is possible to use frequency computed via atom workspace
atom.selectedProject.workspace.addVariable('freq', [1e9, 2e9]);
atom.selectedProject.physics.setFrequencyList('freq')

freqList = atom.selectedProject.physics.frequencyList

%% Get values of frequencies
freqList = atom.selectedProject.physics.getFrequencyListValues

%% save project and close it and open again
atom.selectedProject.save;
atom.closeProject();
atom.openProject(fileName);
% frequency point are loaded from hdf file
freqList = atom.selectedProject.physics.frequencyList
%% Quit
atom.quit;