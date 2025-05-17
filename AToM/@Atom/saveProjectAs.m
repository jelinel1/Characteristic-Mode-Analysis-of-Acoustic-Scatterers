%% saveProjectAs can creates copy of opened project
% This function creates copy of opened project in AToM instance. It is possible
% use only projects name. In this case the copy will be created to default AToM
% path. Using full file name the copy can be created anywhere. Instead
% 'currentProject' will be open 'newProjectName' and 'currentProject' will be
% closed
%
%  INPUTS
%   currentProject: project name, string [1 x N]
%   newProjectName: project name, string [1 x N]
%
%  SYNTAX
%
%  saveProjectAs(currentProject, newProjectName)
%
% 'currentProject' has to be project name of already opened project in AToM.
% 'newProjectName' can be just project name and new project will be created to
% default AToM path or it can be full file name and new project will be created
% to written path.
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
