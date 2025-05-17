%% prepareExampleSession preparation for run of AToM examples
% This static method performes routines necessary before run of an example .
%
%  INPUTS
%   fileName: absolute path to project file (no extension), char [1 x N]
%   atomRefName: name of possible AToM reference, char [1 x N]
%
%  OUTPUTS
%   fullPath: absolute path to project file (with extension), char [1 x N]
%
%  SYNTAX
%
%  fullPath = models.utilities.prepareExampleSession(fileName, atomRefName)
%
% Absolute path to project file (including extension .atom) is created. It is
% checked if instance of AToM under name _atomRefName_ exists and if so it is
% closed. Existance of project file specified by _fileName_ is checked. If it
% exists, the file is deleted.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2016, Petr Kadlec, BUT, petr.kadlec@antennatoolbox.com
% mcode
