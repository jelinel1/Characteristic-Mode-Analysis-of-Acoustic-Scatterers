%% createHiddenVariables add hidden variables into Workspace.
% Added variables are not accesible via GUI and only model, which created
% variable, has its reference.
%
%  INPUTS
%   expression: expression of hidden variable, char/double/logical [1 x n]
%   description: description of hidden variable, char/double/logical [1 x n]
%
%  OUTPUTS
%   var: reference to the hidden variable, Variable [1 x 1]
%
%  SYNTAX
%
%  vars = model.createHiddenVariables(expression, 'description');
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
