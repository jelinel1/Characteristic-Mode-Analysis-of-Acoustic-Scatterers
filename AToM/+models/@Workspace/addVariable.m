%% addVariable add variable into container list of instance of Workspace class.
% Added variable is then directly accesible via GUI editor or other workspace
% methods.
%
%  INPUTS
%   name: name of added variable, char [1 x n]
%   expression: arbitrary MATLAB evaluable expression of variable, char
%               [1 x n], double [n x n]
%   description: description of variable, char [1 x n]
%                This parameter is optional.
%
%  SYNTAX
%
%  workspace.addVariable(name, expression, description);
%  workspace.addVariable(name, expression);
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
