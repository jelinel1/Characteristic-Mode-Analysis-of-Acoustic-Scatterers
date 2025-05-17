%% editExpression change variable expression preserving its name and description
% This method change variable expression preserving its name and description.
%
%  INPUTS
%   nameOfVar: name of variable to be edited, char [1 x N],
%              or reference to variable to be deleted, models.Variable [1 x 1]
%   newDescription: new description of variable, char [n x 1], double [n x n]
%
%  SYNTAX
%
%  workspace.editExpression('b', 'exp(1j)');
%
% Included in AToM, info@antennatoolbox.com
% (c) 2015, Viktor Adler, CTU in Prague, viktor.adler@antennatoolbox.com
