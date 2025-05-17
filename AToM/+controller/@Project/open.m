%% open method opens each model in AToM with full functionality
% This function calls method open of HDF class and creates reference to HDF file
% there. Next, this function set properties of Project class which are loaded
% from HDF. After all, method "load" of each model is called.
%
%  INPUTS
%   project: reference to project instance, Project
%
%  OUTPUTS
%   project: reference to project instance, Project
%
%  SYNTAX
%
%  project = open(project)
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Filip Kozak, CTU in Prague, filip.kozak@antennatoolbox.com
